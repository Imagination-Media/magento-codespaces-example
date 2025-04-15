# Magento Codespaces Example

This repository provides a ready-to-use GitHub Codespaces configuration for Adobe Commerce/Magento 2 development. It includes pre-configured environments for standard development, xDebug debugging, and Blackfire profiling.

![GitHub Codespaces Demo](./images/github_codespaces_demo.png)

## What is GitHub Codespaces?

GitHub Codespaces is a cloud-based development environment that allows developers to code, test, and debug applications directly from their browser. It provides a fully configured development environment in the cloud, eliminating the need for local setup and configuration.

Key features of GitHub Codespaces include:

- **Instant Development Environment**: Spin up a new development environment in seconds, without any local setup.
- **Consistent Environments**: Every team member works in identical environments, eliminating "it works on my machine" issues.
- **Powerful Resources**: Access to powerful cloud-based computing resources, regardless of your local machine's capabilities.
- **Integrated with GitHub**: Seamless integration with GitHub repositories, pull requests, and code reviews.
- **Customizable**: Fully customizable development environments using devcontainer.json and Docker configurations.

In summary, developers can easily stand-up new development environments based on pre-created templates/cellphone with Visual Studio Code in the browser, meaning they can use any device to write code, even a tablet or smartphone.

## Why GitHub Codespaces is Better Than Traditional Docker Environments

While Docker has revolutionized development environments, GitHub Codespaces offers several advantages:

1. **Zero Local Setup**: No need to install Docker, Docker Compose, or manage container configurations locally.
2. **Reduced Resource Consumption**: No containers running on your local machine means better performance and battery life.
3. **Consistent Performance**: Cloud-based resources provide consistent performance regardless of your local hardware.
4. **Simplified Onboarding**: New team members can start contributing immediately without complex environment setup.
5. **Integrated Development Experience**: Seamless integration with GitHub and VS Code provides a unified workflow.
6. **Automatic Port Forwarding**: Easily access web applications and services running in your Codespace.
7. **Persistent Environments**: Your development environment persists between sessions, maintaining your workspace state.
8. **Scalable Resources**: Easily adjust computing resources based on project needs.
9. **Cross-Platform Compatibility**: Work from any operating system with a web browser, including mobile devices.
10. **Reduced Maintenance**: No need to maintain Docker installations or troubleshoot container issues.

## Container Images

This Codespaces environment uses container images created and managed by the [Imagination Media Magento Kubernetes repository](https://github.com/Imagination-Media/magento-k8s). These images are specifically optimized for Magento/Adobe Commerce development and include all necessary tools and extensions.

### Supported PHP Versions

The following PHP versions are supported:

- PHP 7.1
- PHP 7.2
- PHP 7.3
- PHP 7.4
- PHP 8.1
- PHP 8.2
- PHP 8.4

Each PHP version is available in both AMD64 and ARM64 architectures, ensuring compatibility with various development environments.

## Environment Configurations

This repository includes three different environment configurations:

1. **Standard Environment**: Default configuration for general development work.
2. **xDebug Environment**: Configured with xDebug for step-by-step debugging and code analysis.
3. **Blackfire Environment**: Set up with Blackfire for performance profiling and optimization.

You can choose the appropriate environment based on your development needs.

## Setting Up for a Magento/Adobe Commerce Project

To use this Codespaces configuration for your Magento/Adobe Commerce project:

1. Copy the `.devcontainer` folder from this repository to your project's root directory.
2. Adjust the configuration as needed for your specific project requirements.
3. Commit and push the changes to your GitHub repository.
4. Click the "Code" button on your repository and select "Create codespace on [branch]".

That's it! GitHub will create a new Codespace with your Magento environment ready to use.

### Configuration Adjustments

You may need to adjust the following in the `devcontainer.json` file:

- Resource allocation (CPU, memory, storage)
- PHP version
- Database configuration
- Additional extensions or tools

## Configuring xDebug

The xDebug environment comes pre-configured for PHP debugging. To use it:

1. Select the xDebug environment when creating your Codespace.
2. The VS Code xDebug extension is automatically installed and configured.
3. Set breakpoints in your code by clicking in the gutter next to line numbers.
4. Start debugging by clicking the "Run and Debug" icon in the VS Code sidebar and selecting "Listen for xDebug".
5. Execute your code (load a page in the browser) to trigger the debugger.

xDebug is configured with the following settings:

```
xdebug.mode=debug
xdebug.client_host=host.docker.internal
xdebug.client_port=9003
xdebug.start_with_request=yes
```

## Configuring Blackfire

The Blackfire environment is set up for performance profiling:

1. Select the Blackfire environment when creating your Codespace.
2. Configure your Blackfire credentials in the environment variables.
3. Use the Blackfire browser extension or CLI to profile your application.

Blackfire helps identify performance bottlenecks and optimize your Magento application.

## Available Tools

The Codespaces environments include several tools to help with Magento development:

- **n98-magerun2**: CLI tools for Magento administration and development.
- **mage2tv-cache-clean**: File watcher that cleans Magento cache when files are modified.
- **magepack**: Tool for optimizing Magento 2 frontend performance via JavaScript bundling.
- **corediff**: Security tool by Sansec that verifies if Magento core code was modified/compromised.

## Database Setup

The environment includes a MariaDB database pre-configured for Magento. The database is initialized with the SQL dump from the `mysql-dump` directory.

## Port Forwarding

The following ports are automatically forwarded:

- **80**: Web server (Nginx)
- **3306**: MariaDB
- **9200**: Elasticsearch/OpenSearch
- **15672**: RabbitMQ Management
- **8025**: MailHog (for email testing)

## Getting Started

1. Navigate to your GitHub repository
2. Click the "Code" button
3. Select the "Codespaces" tab
4. Click "Create codespace on [branch]"
5. Choose your environment configuration (standard, xDebug, or Blackfire)
6. Wait for the environment to build and start
7. Start developing!

## Additional Resources

- [GitHub Codespaces Documentation](https://docs.github.com/en/codespaces)
- [VS Code Remote Development](https://code.visualstudio.com/docs/remote/remote-overview)
- [Magento DevDocs](https://devdocs.magento.com/)
- [Imagination Media Magento K8s Repository](https://github.com/Imagination-Media/magento-k8s)
