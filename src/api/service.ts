import db from "../db/index";

export const ApiService = {
  getStatesQuery() {
    return db.query.state.findMany();
  },
};

export type ApiService = typeof ApiService;
