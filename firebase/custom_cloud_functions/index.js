const admin = require("firebase-admin/app");
admin.initializeApp();

const scheduleRestoranVisibilityChange = require("./schedule_restoran_visibility_change.js");
exports.scheduleRestoranVisibilityChange =
  scheduleRestoranVisibilityChange.scheduleRestoranVisibilityChange;
