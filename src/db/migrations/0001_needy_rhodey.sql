DO $$ BEGIN
 CREATE TYPE "public"."booking_status" AS ENUM('accepted', 'refused', 'completed');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "public"."provider_service_enum" AS ENUM('walking_the_dog');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "gig_consumers" (
	"id" serial PRIMARY KEY NOT NULL,
	"user_id" integer NOT NULL,
	"address" varchar(255) NOT NULL,
	"description" varchar(255) NOT NULL,
	"contact_number" varchar(255) NOT NULL,
	CONSTRAINT "gig_consumer_user_id_idx" UNIQUE("user_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "gig_providers" (
	"id" serial PRIMARY KEY NOT NULL,
	"user_id" integer NOT NULL,
	"description" varchar(255) NOT NULL,
	"contact_number" varchar(255) NOT NULL,
	CONSTRAINT "gig_provider_user_id_idx" UNIQUE("user_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "provider_services" (
	"id" serial PRIMARY KEY NOT NULL,
	"provider_id" integer NOT NULL,
	"rating" integer NOT NULL,
	"service_name" "provider_service_enum" NOT NULL,
	"availability" varchar(255) NOT NULL,
	"experience" varchar(255) NOT NULL,
	"additional_info" varchar(255) NOT NULL,
	"geo" geometry(point)[] NOT NULL,
	CONSTRAINT "provider_services_idx" UNIQUE("provider_id","service_name")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "service_bookings" (
	"id" serial PRIMARY KEY NOT NULL,
	"consumer_id" integer NOT NULL,
	"provider_service_id" integer NOT NULL,
	"geo" geometry(point) NOT NULL,
	"status" "booking_status" NOT NULL,
	"booking_date" date NOT NULL,
	"contract_start_date" date NOT NULL,
	"contract_end_date" date NOT NULL,
	"contract_duration" varchar(255) NOT NULL
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "provider_services" ADD CONSTRAINT "provider_services_provider_id_gig_providers_id_fk" FOREIGN KEY ("provider_id") REFERENCES "public"."gig_providers"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "service_bookings" ADD CONSTRAINT "service_bookings_consumer_id_gig_consumers_id_fk" FOREIGN KEY ("consumer_id") REFERENCES "public"."gig_consumers"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "service_bookings" ADD CONSTRAINT "service_bookings_provider_service_id_provider_services_id_fk" FOREIGN KEY ("provider_service_id") REFERENCES "public"."provider_services"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
