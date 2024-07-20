import { geometry, integer, pgEnum, pgTable, serial, unique, varchar } from 'drizzle-orm/pg-core';
import gigProviders from './gigProvider';
import { relations } from 'drizzle-orm/relations';


export const providerServiceEnum = pgEnum('provider_service_enum', ['walking_the_dog']);

const providerServices = pgTable('provider_services', {
  id: serial('id').primaryKey(),
  providerId: integer('provider_id').notNull().references(() => gigProviders.id),
  rating: integer('rating'),
  serviceName: providerServiceEnum('service_name').notNull(),
  availability: varchar('availability', { length: 255 }),
  experience: varchar('experience', { length: 255 }),
  additionalInfo: varchar('additional_info', { length: 255 }),
  locations: geometry('location', { type: 'point', mode: "xy" }).array().notNull(),
},  table => ({
  providerServicesIdx: unique('provider_services_idx').on(table.providerId, table.serviceName)

}));

export const providerServicesRelations = relations(providerServices, ({one}) => ({
  gigProviders: one(gigProviders, {
    fields: [providerServices.providerId],
    references: [gigProviders.id],
  })
}));

export default providerServices;