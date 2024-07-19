import db from "../db/index";

export const ApiService = {
  getStatesQuery() {
    return db.query.gigConsumers.findMany();
  },
};

export type ApiService = typeof ApiService;
