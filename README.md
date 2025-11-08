# Welcome to your Lovable project

## Project info

## How can I edit this code?

There are several ways of editing your application.

**Use Lovable**

Changes made via Lovable will be committed automatically to this repo.

**Use your preferred IDE**

If you want to work locally using your own IDE, you can clone this repo and push changes. Pushed changes will also be reflected in Lovable.

The only requirement is having Node.js & npm installed - [install with nvm](https://github.com/nvm-sh/nvm#installing-and-updating)

Follow these steps:

```sh
# Step 1: Clone the repository using the project's Git URL.
git clone <YOUR_GIT_URL>

# Step 2: Navigate to the project directory.
cd <YOUR_PROJECT_NAME>

# Step 3: Install the necessary dependencies.
npm i

# Step 4: Start the development server with auto-reloading and an instant preview.
npm run dev
```

**Edit a file directly in GitHub**

- Navigate to the desired file(s).
- Click the "Edit" button (pencil icon) at the top right of the file view.
- Make your changes and commit the changes.

**Use GitHub Codespaces**

- Navigate to the main page of your repository.
- Click on the "Code" button (green button) near the top right.
- Select the "Codespaces" tab.
- Click on "New codespace" to launch a new Codespace environment.
- Edit files directly within the Codespace and commit and push your changes once you're done.

## What technologies are used for this project?

This project is built with:

- Vite
- TypeScript
- React
- shadcn-ui
- Tailwind CSS

## How can I deploy this project?

Simply open [Lovable](https://lovable.dev/projects/e9da8894-50c8-4589-bc20-ce2de6c30ea5) and click on Share -> Publish.

## Can I connect a custom domain to my Lovable project?

Yes, you can!

To connect a domain, navigate to Project > Settings > Domains and click Connect Domain.

Read more here: [Setting up a custom domain](https://docs.lovable.dev/tips-tricks/custom-domain#step-by-step-guide)





# Web Agent on AWS (EC2) – Operations Guide

## Overview
This guide covers starting, checking, logging, and restarting the two services required for your Python AI agent on an EC2 instance:
- **flask-server** (Flask backend)
- **livekit-agent** (Agent process)

## Service Status
Check if both services are running:
```
sudo systemctl status flask-server
sudo systemctl status livekit-agent
```
If both show **active (running)** in green, you’re good to go 🎉

## Start Services (if not running)
```
sudo systemctl start flask-server
sudo systemctl start livekit-agent
```

## View Live Logs (Debugging)
**Flask server logs:**
```
sudo journalctl -u flask-server -f
```
**Agent logs (use another terminal):**
```
sudo journalctl -u livekit-agent -f
```
Press **Ctrl+C** to stop viewing logs.

## Restart Services
```
sudo systemctl restart flask-server
sudo systemctl restart livekit-agent
```

## Health Check
Verify the Flask server health endpoint:
```
curl http://localhost:5001/health
```
Expected response:
```
{"status":"healthy","service":"avatar-backend"}
```

## One-Liner Status Check
```
sudo systemctl status flask-server livekit-agent
```

## Simple Workflow After Reconnecting to EC2
1) **Check status**
```
sudo systemctl status flask-server livekit-agent
```
2) **Test server**
```
curl http://localhost:5001/health
```

### Only If There’s a Problem
**Restart services:**
```
sudo systemctl restart flask-server
sudo systemctl restart livekit-agent
```
**Check recent agent logs:**
```
sudo journalctl -u livekit-agent -n 50 --no-pager
```

