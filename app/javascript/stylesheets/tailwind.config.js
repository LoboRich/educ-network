module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        'my-pink': '#D96098',
        'my-white': '#FAEEE7',
        'my-teal': '#24A19C',
        'my-blue': '#325288'
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/forms'),
  ],
}
