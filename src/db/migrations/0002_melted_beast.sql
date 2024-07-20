ALTER TABLE "provider_services" RENAME COLUMN "geo" TO "location";--> statement-breakpoint
ALTER TABLE "service_bookings" RENAME COLUMN "geo" TO "location";--> statement-breakpoint
ALTER TABLE "gig_consumers" ALTER COLUMN "address" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "gig_consumers" ALTER COLUMN "description" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "gig_providers" ALTER COLUMN "description" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "provider_services" ALTER COLUMN "rating" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "provider_services" ALTER COLUMN "availability" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "provider_services" ALTER COLUMN "experience" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "provider_services" ALTER COLUMN "additional_info" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "service_bookings" ALTER COLUMN "booking_date" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "service_bookings" ALTER COLUMN "contract_start_date" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "service_bookings" ALTER COLUMN "contract_end_date" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "service_bookings" ALTER COLUMN "contract_duration" DROP NOT NULL;