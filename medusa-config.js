module.exports = {
    projectConfig: {
      database_extra: 
        process.env.NODE_ENV !== "development"
          ? { ssl: { rejectUnauthorized: false } }
          : {},
      // ...
    },
    // ...
  }