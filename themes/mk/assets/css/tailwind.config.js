const themeDir = __dirname + "/../../";
module.exports = {
  purge: {
    //enabled: process.env.HUGO_ENVIRONMENT === "production",
    //enabled: true,
    content: [themeDir + "layouts/**/*.html"],
    options: {
      whitelist: [],
    },
  },
  theme: {
    extend: {},
  },
  variants: {},
  plugins: [],
};
