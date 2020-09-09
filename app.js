const express = require('express');

const app = express();
const port = 3000;
const state = { isShutdown: false };
const TIMEOUT_IN_MS = 30 * 1000;

app.get('/', (req, res) => {
  res.send('Hello');
});

app.get('/health', (req, res) => {
  if (state.isShutdown) {
    res.writeHead(500);
    return res.end('not ok');
  }

  res.writeHead(200);
  return res.end('ok');
});

const server = app.listen(port, () => {
  console.info(`Application running... port: ${port}`);
});

const startGracefulShutdown = () => {
  console.info('Starting shutdown of express...', new Date().toISOString());
  state.isShutdown = true;

  setTimeout(() => {
    server.close()
      .then(() => {
        console.info('shutdown complete');
        process.exit(0);
      })
      .catch((err) => {
        console.error('Error happened during graceful shutdown', err);
        process.exit(1);
      });
  }, TIMEOUT_IN_MS);
};

const signals = ['SIGINT', 'SIGTERM', 'SIGQUIT'];
signals.forEach((signal) => {
  process.on(signal, startGracefulShutdown);
});
