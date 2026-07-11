# Wedding Invitation

A complete, production-ready **Wedding Invitation** web application built with
**Java Servlets and JSP only** — no Spring Boot, no React/Angular, no Docker,
no Kubernetes. Built with **Maven**, packaged as a **WAR**, deployed on
**Apache Tomcat**, hosted on **AWS EC2**, with CI/CD via **Jenkins Pipeline**
and version control via **Git/GitHub**.

## Project Structure

```
wedding-invitation/
├── pom.xml
├── Jenkinsfile
├── .gitignore
├── README.md
└── src/
    ├── main/
    │   ├── java/com/weddinginvitation/
    │   │   ├── servlet/
    │   │   │   ├── RsvpServlet.java        # Handles RSVP form POST
    │   │   │   └── AdminRsvpServlet.java   # Protected list of RSVPs
    │   │   ├── model/
    │   │   │   └── RsvpEntry.java          # RSVP data object
    │   │   └── store/
    │   │       └── RsvpStore.java          # Thread-safe in-memory RSVP store
    │   └── webapp/
    │       ├── WEB-INF/web.xml
    │       ├── index.jsp                   # Home page
    │       ├── story.jsp                   # Our Story page
    │       ├── gallery.jsp                 # Gallery page
    │       ├── schedule.jsp                # Event schedule
    │       ├── rsvp.jsp                     # RSVP form
    │       ├── thankyou.jsp                # RSVP confirmation
    │       ├── contact.jsp                 # Contact + map placeholder
    │       ├── admin.jsp                   # Protected RSVP list view
    │       ├── error.jsp                   # Error page
    │       ├── header.jsp / footer.jsp     # Shared JSP includes
    │       ├── style.css
    │       ├── script.js
    │       └── images/                     # Put real photos here
    └── test/java/com/weddinginvitation/
        └── RsvpStoreTest.java              # JUnit tests
```

## Features

1. **Home Page** — elegant hero section with bride & groom names, wedding date/time/venue
2. **Countdown Timer** — live JavaScript countdown to the wedding date
3. **Our Story** — relationship timeline
4. **Gallery** — responsive photo grid (CSS placeholders, ready to swap for real images)
5. **Event Schedule** — Mehendi, Haldi, Wedding Ceremony, Reception cards
6. **RSVP Form** — Name, Email, Phone, Guests, Message, with server-side and client-side validation
7. **Contact Page** — contact details + Google Maps embed placeholder
8. **Admin Page** — password-protected list of all RSVP submissions
9. **Responsive design** — mobile navigation toggle, responsive grid layouts
10. **No database required** — RSVPs are stored in a thread-safe in-memory store
    (`RsvpStore`), keeping the stack dependency-free. See "Upgrading to a Database"
    below if you want persistence across restarts.

## Tech Stack

| Layer          | Technology                          |
|----------------|--------------------------------------|
| Language       | Java 11                              |
| Web layer      | Servlets 4.0 + JSP + JSTL             |
| Build          | Maven (`pom.xml`, packaging = `war`) |
| App server     | Apache Tomcat 9                      |
| CI/CD          | Jenkins Declarative Pipeline          |
| Source control | Git + GitHub                          |
| Hosting        | AWS EC2                               |

## 1. Build

```bash
mvn clean package
```

This produces `target/wedding-invitation.war`. No external services are
required to build or run the application — there is no database dependency.

## 2. Run Locally

Copy the WAR into any local Tomcat 9 installation's `webapps/` folder and start
Tomcat:

```bash
cp target/wedding-invitation.war $CATALINA_HOME/webapps/
$CATALINA_HOME/bin/startup.sh
```

Then visit `http://localhost:8080/wedding-invitation/`.

## 3. AWS EC2 Setup

1. Launch an EC2 instance (Amazon Linux 2 or Ubuntu; `t2.micro`/`t3.micro` is enough).
2. Security Group inbound rules:
   - **22** (SSH) — from your IP / Jenkins server
   - **8080** (Tomcat), or **80** if you put a reverse proxy in front
3. SSH in and install Java + Tomcat:

```bash
# Amazon Linux 2
sudo yum update -y
sudo yum install -y java-11-amazon-corretto wget

# Ubuntu
sudo apt-get update -y
sudo apt-get install -y openjdk-11-jdk wget
```

4. Install Tomcat 9 and register it as a systemd service:

```bash
sudo useradd -m -d /opt/tomcat -U -s /bin/false tomcat
cd /tmp
wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.85/bin/apache-tomcat-9.0.85.tar.gz
sudo mkdir -p /opt/tomcat
sudo tar xzf apache-tomcat-9.0.85.tar.gz -C /opt/tomcat --strip-components=1
sudo chown -R tomcat:tomcat /opt/tomcat
sudo chmod +x /opt/tomcat/bin/*.sh

sudo tee /etc/systemd/system/tomcat.service << 'SERVICE'
[Unit]
Description=Apache Tomcat
After=network.target

[Service]
Type=forking
User=tomcat
Group=tomcat
Environment=CATALINA_HOME=/opt/tomcat
Environment=CATALINA_BASE=/opt/tomcat
ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target
SERVICE

sudo systemctl daemon-reload
sudo systemctl enable tomcat
sudo systemctl start tomcat
```

5. Create an admin user for the protected `/admin/rsvps` page in
   `/opt/tomcat/conf/tomcat-users.xml`:

```xml
<role rolename="wedding-admin"/>
<user username="admin" password="CHANGE_ME" roles="wedding-admin"/>
```

Restart Tomcat after editing (`sudo systemctl restart tomcat`).

## 4. Git & GitHub

```bash
cd wedding-invitation
git init
git add .
git commit -m "Initial commit: Wedding Invitation web app"
git branch -M main
git remote add origin https://github.com/<your-username>/wedding-invitation.git
git push -u origin main
```

## 5. Jenkins Pipeline Setup

1. Install these Jenkins plugins: **Pipeline**, **Git**, **SSH Agent**, **Credentials Binding**.
2. Add credentials (Manage Jenkins → Credentials → System → Global credentials):
   - `ec2-ssh-key` — Kind: **SSH Username with private key** (your EC2 `.pem` key).
   - `ec2-host` — Kind: **Secret text**, value like `ec2-user@<EC2_PUBLIC_IP>`.
3. Create a new **Pipeline** job:
   - Definition: *Pipeline script from SCM*
   - SCM: Git → your GitHub repo URL
   - Script Path: `Jenkinsfile`
4. (Optional) Add a GitHub webhook to auto-trigger builds on push to `main`:
   GitHub repo → Settings → Webhooks → add `http://<jenkins-host>:8080/github-webhook/`,
   content type `application/json`, event: `push`. Then enable **GitHub hook
   trigger for GITScm polling** on the Jenkins job.

### Pipeline Stages (see `Jenkinsfile`)

| Stage          | What it does                                                        |
|----------------|-----------------------------------------------------------------------|
| Checkout       | Pulls the latest code from GitHub                                    |
| Build          | `mvn clean compile`                                                   |
| Test           | `mvn test`, publishes JUnit results                                    |
| Package        | `mvn package`, archives the WAR as a build artifact                   |
| Deploy to EC2  | Copies the WAR via `scp` and restarts Tomcat over `ssh` (only on `main`) |

The deploy stage is entirely inline inside the `Jenkinsfile` (no external
shell scripts), so the project keeps exactly the structure requested:
`src/`, `pom.xml`, `Jenkinsfile`, `.gitignore`, `README.md`.

## 6. Manual Deployment (without Jenkins)

```bash
mvn clean package
scp -i your-key.pem target/wedding-invitation.war ec2-user@<EC2_PUBLIC_IP>:/tmp/
ssh -i your-key.pem ec2-user@<EC2_PUBLIC_IP>
sudo systemctl stop tomcat
sudo rm -rf /opt/tomcat/webapps/wedding-invitation /opt/tomcat/webapps/wedding-invitation.war
sudo cp /tmp/wedding-invitation.war /opt/tomcat/webapps/wedding-invitation.war
sudo systemctl start tomcat
```

## 7. Accessing the App

```
http://<EC2_PUBLIC_IP>:8080/wedding-invitation/
http://<EC2_PUBLIC_IP>:8080/wedding-invitation/story.jsp
http://<EC2_PUBLIC_IP>:8080/wedding-invitation/gallery.jsp
http://<EC2_PUBLIC_IP>:8080/wedding-invitation/schedule.jsp
http://<EC2_PUBLIC_IP>:8080/wedding-invitation/rsvp.jsp
http://<EC2_PUBLIC_IP>:8080/wedding-invitation/contact.jsp
http://<EC2_PUBLIC_IP>:8080/wedding-invitation/admin/rsvps   (BASIC auth prompt)
```

For a clean URL without the port, put Nginx or an Application Load Balancer in
front of Tomcat and forward port 80 → 8080.

## Upgrading to a Database

RSVPs are currently kept in memory (`RsvpStore`), which is simple and
dependency-free but does not survive a Tomcat restart. To persist RSVPs:

1. Add a JDBC driver dependency to `pom.xml` (e.g. MySQL Connector/J).
2. Replace the internals of `RsvpStore` with JDBC calls (or introduce a DAO
   class) while keeping its public method signatures (`add`, `findAll`,
   `totalGuestCount`, `totalRsvpCount`) unchanged — `RsvpServlet` and
   `AdminRsvpServlet` will keep working without modification.
3. Configure a JNDI DataSource on the Tomcat server (not in Git) for the
   database credentials.

## Customizing the Invitation

- Bride/groom names, date, venue: `index.jsp`, `schedule.jsp`, `footer.jsp`
- Countdown target date: `data-wedding-date` attribute in `index.jsp` (`script.js` reads it)
- Real photos: add files to `src/main/webapp/images/` and update `gallery.jsp`
- Map location: update the `q=` parameter in the iframe `src` in `contact.jsp`
- Colors/fonts: CSS variables at the top of `style.css`

## Security Notes

- The admin RSVP list (`/admin/rsvps`) is protected by a `security-constraint`
  in `web.xml` combined with Tomcat's realm (`tomcat-users.xml`).
- No secrets are stored in the repository.
- For real production use, terminate TLS at an ALB/Nginx layer in front of Tomcat.
