const app = require('./app');
const pool = require('./src/confing/db');
const studentRoutes = require('./src/routes/userRoutes');

app.get('/', (req, res) => {
  res.json({
    service: 'Student Service',
    status: 'running',
  });
});

app.get('/health', async (req, res) => {
  try {
    await pool.query('SELECT 1');

    res.json({
      service: 'Student Service',
      database: 'connected',
    });
  } catch (error) {
    res.status(503).json({
      service: 'Student Service',
      database: 'unavailable',
    });
  }
});

app.use('/students', studentRoutes);

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Server is running in development mode on port ${PORT}`);
});