db.inventory.aggregate([
  {
    $bucket: {
      groupBy: "$year", // Field to group by (the year in this case)
      boundaries: [1980, 1990, 2000, 2010, 2020], // The boundaries for the buckets
      default: "Other", // The label for any documents that don't fit into the boundaries
      output: {
        count: { $sum: 1 }, // Count the number of documents in each bucket
        cars: { $push: { name: "$name", model: "$model" } } // Create an array of name and model for each bucket
      }
    }
  }
])

db.inventory.aggregate([
  {
    $bucketAuto: {
      groupBy: "$year", // Group by the 'year' field
      buckets: 5, // Create 5 automatic buckets based on the distribution of the 'year' values
      output: {
        count: { $sum: 1 }, // Count the number of documents in each bucket
        cars: { $push: { name: "$name", model: "$model" } } // Push 'name' and 'model' into an array for each bucket
      }
    }
  }
])
