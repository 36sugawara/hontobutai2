module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  daisyui: {
    theme: {
      container: {
        padding: {
          DEFAULT: '1rem',
          sm: '2rem',
          lg: '6rem',
          xl: '10rem',
          '2xl': '12rem',
        },
      },
    },
    themes: [
      {
        mytheme: {
          "primary": "#5584AC",
          "secondary": "#ffffff",
          "accent": "#9ca3af",
          "neutral": "#82AAE3",
          "base-100": "#EFFFFD",
          "info": "#f3f4f6",
          "success": "#00C897",
          "warning": "#FFE300",
          "error": "#FF5D5D",
        },
      },
    ],
  },
  plugins: [
    require("daisyui")]
}
