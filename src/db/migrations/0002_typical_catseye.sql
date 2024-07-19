ALTER TABLE "provider_services" DROP CONSTRAINT "provider_id_idx";--> statement-breakpoint
ALTER TABLE "service_bookings" DROP CONSTRAINT "consumer_id_idx";--> statement-breakpoint
ALTER TABLE "service_bookings" DROP CONSTRAINT "provider_service_id_idx";