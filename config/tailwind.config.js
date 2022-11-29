/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './app/views/pages/home.html.erb'
  ],
  theme: {
    extend: {},
  },
  plugins: [require("daisyui")],

  daisyui: {
    styled: true,
    themes: false,
    base: true,
    utils: true,
    logs: true,
    rtl: false,
    prefix: "",
    darkTheme: "light",
  },
}
