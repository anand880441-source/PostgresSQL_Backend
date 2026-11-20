const pool = require('../confing/db');

const getStudents = async (req, res) => {
  try {
    const result = await pool.query(
      "SELECT * FROM students ORDER BY id"
    );

    res.json(result.rows);
  } catch (error) {
    console.error(error.message);
    res.status(500).json({
      error: "Failed to fetch students",
    });
  }
};

const addStudent = async (req, res,) => {
  const { name, email, course } = req.body;

  if (!name || !email || !course) {
    return res.status(400).json({
      error: "Name, email, and course are required",
    });
  }

  try {
    const result = await pool.query(
      `INSERT INTO students (name, email, course)
       VALUES ($1, $2, $3)
       RETURNING *`,
      [name, email, course]
    );

    res.status(201).json(result.rows[0]);
  } catch (error) {
    if (error.code === "23505") {
      return res.status(409).json({
        error: "Email already exists",
      });
    }

    console.error(error.message);
    res.status(500).json({
      error: "Failed to add student",
    });
  }
};


const profile = async (req, res) => {
  res.json({
    message: 'Protected route accessed successfully',
    user: req.user,
  });
};

module.exports = { getStudents, addStudent, profile };