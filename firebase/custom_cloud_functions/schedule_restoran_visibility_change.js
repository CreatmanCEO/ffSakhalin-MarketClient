const functions = require("firebase-functions");
const admin = require("firebase-admin");
//admin.initializeApp();

exports.scheduleRestoranVisibilityChange = functions.firestore
  .document("ScheduledTasks/{taskId}")
  .onCreate(async (snap, context) => {
    const task = snap.data();
    const { orderId, restoranId, taskType, scheduledTime } = task;

    if (taskType !== "restoranVisibilityChange") return; // Проверка типа задачи

    const now = Date.now();
    const timeToExecute = scheduledTime.toMillis() - now;

    setTimeout(async () => {
      try {
        const orderDoc = await admin
          .firestore()
          .collection("Order")
          .doc(orderId)
          .get();
        if (orderDoc.exists && orderDoc.data().status === "Создан") {
          await admin
            .firestore()
            .collection("restoran")
            .doc(restoranId)
            .update({ visible: false });
          console.log(`Restoran ${restoranId} visibility updated to false`);
        } else {
          console.log(
            `Order ${orderId} does not exist or status is not 'Создан'`,
          );
        }
      } catch (error) {
        console.error(`Error updating restoran visibility: ${error}`);
      }
    }, timeToExecute);
  });

// To avoid deployment errors, do not call admin.initializeApp() in your code
