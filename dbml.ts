import * as schema from './src/db/schema/index';

import { pgGenerate } from 'drizzle-dbml-generator';
console.log({schema})
const out = './schema.dbml';
const relational = true;

pgGenerate({schema, out, relational});