import { relations } from 'drizzle-orm';
import { date, geometry, integer, pgEnum, pgTable, serial, unique, varchar } from 'drizzle-orm/pg-core';
import gigConsumers from './gigConsumer';
import providerServices from './providerServices';

export const bookingStatusEnum = pgEnum('booking_status', ['accepted', 'refused', 'completed']);

const serviceBookings = pgTable('service_bookings', {
  id: serial('id').primaryKey(),
  consumerId: integer('consumer_id').notNull().references(() => gigConsumers.id),
  providerServiceId: integer('provider_service_id').notNull().references(() => providerServices.id),
  location: geometry('geo', { type: 'point', mode: "xy" }).notNull(),
  status: bookingStatusEnum('status').notNull(),
  bookingDate: date('booking_date', { mode: 'date' }).notNull(),
  contractStartDate: date('contract_start_date', { mode: 'date' }).notNull(),
  contractEndDate: date('contract_end_date', { mode: 'date' }).notNull(),
  contractDuration: varchar('contract_duration', { length: 255 }).notNull(),
});

export const serviceBookingsRelations = relations(serviceBookings, ({one}) => ({
  gigConsumers: one(gigConsumers, {
    fields: [serviceBookings.consumerId],
    references: [gigConsumers.id],
  }),
  providerServices: one(providerServices, {
    fields: [serviceBookings.providerServiceId],
    references: [providerServices.id],
  }),
}));

export default serviceBookings;