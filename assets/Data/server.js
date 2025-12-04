const express = require("express");
const cors = require("cors");
const db = require("./database");

const app = express();
app.use(cors());
app.use(express.json());

// =======================
// CREATE
// =======================
app.post("/components", (req, res) => {
  const { brand, model, part_number, part_info, description } = req.body;

  db.run(
    `INSERT INTO components (brand, model, part_number, part_info, description)
     VALUES (?, ?, ?, ?, ?)`,
    [brand, model, part_number, part_info, description],
    function (err) {
      if (err) return res.status(500).json({ error: err.message });

      res.json({
        id: this.lastID,
        brand,
        model,
        part_number,
        part_info,
        description,
      });
    }
  );
});

// =======================
// READ ALL
// =======================
app.get("/components", (req, res) => {
  db.all(`SELECT * FROM components`, [], (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(rows);
  });
});

// =======================
// SEARCH BY PART NUMBER
// =======================
app.get("/components/search/:part_number", (req, res) => {
  const part = req.params.part_number;

  db.all(
    `SELECT * FROM components WHERE part_number LIKE ?`,
    [`%${part}%`],
    (err, rows) => {
      if (err) return res.status(500).json({ error: err.message });
      res.json(rows);
    }
  );
});

// =======================
// READ SINGLE
// =======================
app.get("/components/:id", (req, res) => {
  db.get(
    `SELECT * FROM components WHERE id = ?`,
    [req.params.id],
    (err, row) => {
      if (err) return res.status(500).json({ error: err.message });
      res.json(row);
    }
  );
});

// =======================
// UPDATE
// =======================
app.put("/components/:id", (req, res) => {
  const { brand, model, part_number, part_info, description } = req.body;

  db.run(
    `
    UPDATE components
    SET brand=?, model=?, part_number=?, part_info=?, description=?
    WHERE id=?
  `,
    [brand, model, part_number, part_info, description, req.params.id],
    function (err) {
      if (err) return res.status(500).json({ error: err.message });

      res.json({ updated: this.changes });
    }
  );
});

// =======================
// DELETE
// =======================
app.delete("/components/:id", (req, res) => {
  db.run(
    `DELETE FROM components WHERE id=?`,
    [req.params.id],
    function (err) {
      if (err) return res.status(500).json({ error: err.message });

      res.json({ deleted: this.changes });
    }
  );
});

// =======================
// START SERVER
// =======================
app.listen(3000, () => {
  console.log("API running at http://localhost:3000");
});
