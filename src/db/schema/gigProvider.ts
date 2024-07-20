import { integer, pgTable, serial, unique, varchar } from 'drizzle-orm/pg-core';

const gigProviders = pgTable('gig_providers', {
  id: serial('id').primaryKey(),
  userId: integer('user_id').notNull(),
  description: varchar('description', { length: 255 }),
  contactNumber: varchar('contact_number', { length: 255 }).notNull(), // personal identifiable information
}, table => ({
  userIdIdx: unique('gig_provider_user_id_idx').on(table.userId)
}));

export default gigProviders;