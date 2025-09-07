# Replit Agent Configuration

## Overview

This is a basic Astro project called "welfare-trust" built using the Astro starter template. Astro is a modern static site generator that focuses on performance by shipping minimal JavaScript to the browser. The project is currently in its initial state with minimal configuration and basic file structure.

## User Preferences

Preferred communication style: Simple, everyday language.

## System Architecture

### Frontend Architecture
- **Framework**: Astro 5.2.5 with TypeScript support
- **Build System**: Astro's built-in Vite-based build system
- **Styling**: Basic CSS with global stylesheets located in both `public/styles/` and `src/styles/`
- **Component Structure**: Standard Astro component architecture with `.astro` files
- **Content Management**: Astro's built-in content collections system (though not yet configured)

### Project Structure
- **Source Directory**: `src/` contains layouts and pages
- **Public Directory**: `public/` for static assets and global CSS
- **Build Output**: `dist/` for production builds
- **Development Server**: Runs on localhost:4321

### Configuration
- **TypeScript**: Configured with strict settings extending Astro's recommended config
- **Dependency Management**: Renovate configured for automated dependency updates
- **Development Environment**: VS Code configuration with Astro extension recommendations

### Design Decisions
- **Static Site Generation**: Chosen for performance and simplicity
- **Minimal JavaScript**: Aligns with Astro's philosophy of shipping less JavaScript
- **TypeScript**: Enabled for better development experience and code safety
- **Component-based Architecture**: Supports reusable UI components through Astro's component system

## External Dependencies

### Core Dependencies
- **Astro**: ^5.2.5 - Main framework for static site generation

### Development Tools
- **TypeScript**: Integrated through Astro's TypeScript support
- **Vite**: Bundled with Astro for fast development and building
- **VS Code Extensions**: Astro language support extension recommended

### Third-party Services
- **Renovate**: Configured for automated dependency management
- **StackBlitz/CodeSandbox**: Integration available for online development

Note: The project is currently using only core Astro functionality without additional integrations for databases, authentication, or external APIs. This provides a clean foundation for future enhancements.