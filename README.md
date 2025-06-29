<div align="center">
<img src="./assets/logo.png" alt="logo" width="120" height="120">
<h1>chatmcp</h1>

Cross-platform `Macos | Windows | Linux | iOS | Android | Web` AI Chat Client

[English](./README.md) | [简体中文](./README_ZH.md) | [Türkçe](./README_TR.md)

</div>

## Install

| macOS                                                   | Windows                                                 | Linux                                                     | iOS                                                      | Android                                                 | Web                                                    |
|---------------------------------------------------------|---------------------------------------------------------|-----------------------------------------------------------|----------------------------------------------------------|---------------------------------------------------------|--------------------------------------------------------|
| [Release](https://github.com/daodao97/chatmcp/releases) | [Release](https://github.com/daodao97/chatmcp/releases) | [Release](https://github.com/daodao97/chatmcp/releases) ¹ | [TestFlight](https://testflight.apple.com/join/dCXksFJV) | [Release](https://github.com/daodao97/chatmcp/releases) | [GitHub Pages](https://daodao97.github.io/chatmcp) ² |

¹ Note: On Linux you need to install `libsqlite3-0` and `libsqlite3-dev`, as this dependency needs it https://pub.dev/packages/sqflite_common_ffi

```bash
sudo apt-get install libsqlite3-0 libsqlite3-dev
```

² Note: Web version runs entirely in your browser with local storage for chat history and settings.

## Documentation

Also, you can use DeepWiki to get more information about chatmcp.  
[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/daodao97/chatmcp) DeepWiki is an AI-powered platform that transforms any
public GitHub repository into a fully interactive, easy-to-understand wiki. By analysing code, documentation, and configuration files, it creates
clear explanations, interactive diagrams, and even allows for real-time Q&A with the AI.

## Preview

![Artifact Display](./docs/preview/artifact.gif)
![Thinking Mode](./docs/preview/think.webp)
![Generate Image](./docs/preview/gen_img.webp)
![LaTeX Support](./docs/preview/latex.webp)
![HTML Preview](./docs/preview/html-preview.webp)
![Mermaid Diagram](./docs/preview/mermaid.webp)
![MCP Workflow](./docs/preview/mcp-workerflow.webp)
![MCP InMemory](./docs/preview/mcp-inmemory.webp)
![MCP Tools](./docs/preview/mcp-tools.webp)
![LLM Provider](./docs/preview/llm-provider.webp)
![MCP Stdio](./docs/preview/mcp-stdio.webp)
![MCP SSE](./docs/preview/mcp-sse.webp)

## Usage

Make sure you have installed `uvx` or `npx` in your system

### MacOS

```bash
# uvx
brew install uv

# npx
brew install node 
```

### Linux

```bash
# uvx
curl -LsSf https://astral.sh/uv/install.sh | sh

# npx (using apt)
sudo apt update
sudo apt install nodejs npm
```

1. Configure Your LLM API Key and Endpoint in `Setting` Page
2. Install MCP Server from `MCP Server` Page
3. Chat with MCP Server

- stdio mcp server
  ![](./docs/mcp_stdio.png)

- sse mcp server
  ![](./docs/mcp_sse.png)

## Debug

- logs & data

macOS:

```bash
~/Library/Application Support/ChatMcp
```

Windows:

```bash
%APPDATA%\ChatMcp
```

Linux:

```bash
~/.local/share/ChatMcp
```

Mobile:

- Application Documents Directory

reset app can use this command

macOS:

```bash
rm -rf ~/Library/Application\ Support/ChatMcp
```

Windows:

```bash
rd /s /q "%APPDATA%\ChatMcp"
```

Linux:

```bash
rm -rf ~/.local/share/ChatMcp
```

## Development

```bash
flutter pub get
flutter run -d macos
```

### Web Version

#### Local Development
```bash
# Install dependencies
flutter pub get

# Run Web version locally
flutter run -d chrome
# Or specify port
flutter run -d chrome --web-port 8080
```

#### Build Web Version
```bash
# Build production version
flutter build web

# Build with base path (for deploying to subdirectory)
flutter build web --base-href /chatmcp/
```

#### Deploy to GitHub Pages
```bash
# 1. Build Web version
flutter build web --base-href /chatmcp/

# 2. Push build/web directory contents to gh-pages branch
# Or use GitHub Actions for automatic deployment
```

After building, files will be in the `build/web` directory and can be deployed to any static website hosting service.

## Features

- [x] Chat with MCP Server
- [ ] MCP Server Market
- [ ] Auto install MCP Server
- [x] SSE MCP Transport Support
- [x] Auto Choose MCP Server
- [x] Chat History
- [x] OpenAI LLM Model
- [x] Claude LLM Model
- [x] OLLama LLM Model
- [x] DeepSeek LLM Model
- [ ] RAG
- [ ] Better UI Design
- [x] Dark/Light Theme

All features are welcome to submit, you can submit your ideas or bugs in [Issues](https://github.com/daodao97/chatmcp/issues)

## MCP Server Market

You can install MCP Server from MCP Server Market, MCP Server Market is a collection of MCP Server, you can use it to chat with different data.

Your feedback helps us improve chatmcp and helps other users make informed decisions.

## Thanks

- [MCP](https://modelcontextprotocol.io/introduction)
- [mcp-cli](https://github.com/chrishayuk/mcp-cli)

## License

This project is licensed under the [Apache License 2.0](./LICENSE).

## Star History

![](https://api.star-history.com/svg?repos=daodao97/chatmcp&type=Date)