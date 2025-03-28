# 🚀 Stellar Quest 3 🚀

**Your Interactive and Engaging Development Adventure Awaits!**
[](https://github.com/codespaces/new?repo=anataliocs/soroban-quest)[](https://app.codeanywhere.com/#https://github.com/anataliocs/soroban-quest)[](https://codesandbox.io/s/github/anataliocs/soroban-quest)

## 🌟 Introduction 🌟

Welcome to **Stellar Quest 3** — a revolutionary and immersive approach to learning and practicing Stellar Smart
Contract development.
Gone are the days of isolated web tutorials. Stellar Quest 3 brings **real-world developer environments** directly to
your fingertips, simplifying your onboarding and metamorphosing your developer experience into a **gamified, engaging,
and fun journey** 🔥.

## ✨ Why Stellar Quest 3? ✨

- 🌍 **Experience Devcontainers:** Adopt cutting-edge OSS technology that lets you spin up highly customized environments
  effortlessly, whether on GitHub Codespaces or other popular cloud platforms.
- 💻 **Code Anywhere, Effortlessly:** Connect seamlessly using your local VS Code IDE or directly access your development
  environment from any browser.
- 🎨 **Customized & Feature-Rich:** Dive into a fully equipped development setup, complete with a beautifully customized
  terminal and IDE, tuned for productivity and aesthetic joy.
- 🖥️ **Built-in GUI and Browser:** Enjoy light desktop integration with Firefox and intuitive graphical file
  management — experience frontend workflows and web integrations right from your development container.
- 🧩 **Wallet Integration:** Seamlessly leverage stellar wallet add-ons such as xBull, or securely build Passkey wallets
  using the open-source Bitwarden password manager.
- 🔑 **Secure Authentication:** Get started effortlessly via secure OAuth integrations with popular platforms like Github
  and Discord.

## 🚦 What's New in Stellar Quest 3? 🚦

Stellar Quest 3 takes engagement one giant step further! Our refreshed developer experience (DX) delivers guided,
curated learning that connects closely with your actual workflow, making your journey from beginner to expert seamless
and inspiring.
Highlights include:

- 📘 **Interactive IDE-Based Learning:** Experience quizzes directly integrated into your IDE through carefully crafted
  VS Code extensions.
- ✅ **Guided Learning Tasks:** Navigate clearly structured, modified TODO tasks, leading you step by step through
  mastering Stellar Smart Contracts.
- 🛠️ **Automated Grading:** Receive automatic feedback via GitHub Actions as you complete quizzes and coding tasks,
  ensuring a transparent and trustable learning progression.
- 🧪 **Realistic Coding Challenges:** Gain practical skills by writing actual testable code that passes robust CI/CD
  pipelines and quality gates—just like a real-world project!

## 🛠️ Development Commands & Tips 🛠️

Here's a quick-reference toolset to streamline your development journey:

### 📋 Codespaces Interaction:

- **Create and manage Codespaces easily via CLI**:

``` bash
# List current Codespaces
gh codespace list

# Create a new Codespace
gh codespace create --repo anataliocs/soroban-quest -b main --status --web -l WestUs2

# Delete all Codespaces (confirmation auto-approved)
echo 'Y' | gh codespace delete --all --force
```

- **Gain SSH Access & Stream logs**:

``` bash
gh codespace ssh
gh codespace logs
```

### 🔐 OAuth via CLI:

Quick OAuth testing using `oauth2c` (replace placeholder values accordingly):

``` bash
oauth2c https://discord.com \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --response-types code \
  --response-mode query \
  --grant-type authorization_code \
  --auth-method client_secret_basic \
  --scopes identity \
  --redirect-url https://your-dev-url:port \
  --callback-tls-cert https://raw.githubusercontent.com/cloudentity/oauth2c/master/data/cert.pem \
  --callback-tls-key https://raw.githubusercontent.com/cloudentity/oauth2c/master/data/key.pem
```

### 📖 Quick Note-taking with DNote CLI:

Document as you go conveniently and rapidly:

- [DNote CLI - Commands](https://github.com/dnote/dnote/wiki/Dnote-CLI#commands)

## 🤝 Join Our Community 🤝

Need further assistance, exciting challenges, or simply want to fly further in your Stellar Quest? Join the vibrant
community of Stellar developers, creators, and enthusiasts:
👉 [Join the Stellar Developers Discord](https://discord.gg/stellardev)
📣 **Ready to Start Your Stellar Journey?**
Make Stellar Quest 3 Your Gateway to Innovation, Growth, and Professional Development! 🚀✨
