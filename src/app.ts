import { Hono } from 'hono';
import { logger } from 'hono/logger';
import { testRoute } from './routes/test-route';

const app = new Hono()

app.use('*', logger())
app.get('/test', c => c.json({message: 'text'}))
app.route('api/test', testRoute);
export default app;