CREATE TABLE IF NOT EXISTS "state" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar(255) NOT NULL,
	"code" varchar(2) NOT NULL,
	CONSTRAINT "state_name_unique" UNIQUE("name"),
	CONSTRAINT "state_code_unique" UNIQUE("code")
);
