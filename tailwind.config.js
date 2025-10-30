/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/main/webapp/**/*.{jsp,html,js}",
    "./src/main/webapp/**/*.jsp"
  ],
  theme: {
    extend: {
      fontFamily: {
        'inter': ['Inter', 'sans-serif'],
      },
      animation: {
        'float-y': 'floatY 6s ease-in-out infinite',
      },
      keyframes: {
        floatY: {
          '0%, 100%': { transform: 'translateY(0px)' },
          '50%': { transform: 'translateY(-12px)' },
        }
      }
    },
  },
  plugins: [],
}
