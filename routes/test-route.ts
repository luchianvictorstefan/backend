import { Hono } from 'hono';

export const testRoute = new Hono()
.get('/', c => c.json({payload: []}))
.post('/', c => c.json({payload: []}))
.delete('/', c => c.json({payload: []}))
.patch('/', c => c.json({payload: []}));