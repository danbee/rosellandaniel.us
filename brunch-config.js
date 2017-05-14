module.exports = {
  modules: {
    wrapper: "commonjs",
    definition: "commonjs"
  },
  paths: {
    watched: ["source/javascripts"],
    public: '.tmp/dist'
  },
  files: {
    javascripts: {
      joinTo: 'javascripts/site.js'
    }
  },
  plugins: {
    babel: {
      presets: ['latest']
    }
  }
}
