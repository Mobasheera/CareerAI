# Tailwind CSS Setup for Career AI

This project now uses Tailwind CSS via the CLI instead of the CDN for production-ready builds.

## Setup

1. **Install dependencies:**
   ```bash
   npm install
   ```

2. **Build CSS for development (with watch mode):**
   ```bash
   npm run build-css
   ```

3. **Build CSS for production (minified):**
   ```bash
   npm run build-css-prod
   ```

## Files Structure

- `tailwind.config.js` - Tailwind configuration file
- `src/main/webapp/css/input.css` - Input CSS file with Tailwind directives and custom styles
- `src/main/webapp/css/output.css` - Generated production CSS file (minified)
- `package.json` - NPM configuration with build scripts

## Custom Styles

The following custom styles are included in the input CSS:
- Glassmorphism effects (`.glass`)
- Button glow effects (`.btn-glow`)
- Floating animations (`.float-y`)
- Custom background gradients

## Development Workflow

1. Make changes to your JSP files using Tailwind classes
2. If you add new custom styles, update `src/main/webapp/css/input.css`
3. Run `npm run build-css-prod` to generate the production CSS
4. The generated CSS is automatically included in all JSP files

## Benefits

- ✅ No more CDN warnings in production
- ✅ Faster loading times (local CSS file)
- ✅ Better caching control
- ✅ Minified CSS for production
- ✅ Tree-shaking (only used classes are included)
- ✅ Custom styles preserved
