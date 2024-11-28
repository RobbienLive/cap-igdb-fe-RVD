using { studentApp } from '../db/schema.cds';

service studentAppSrv {
  @odata.draft.enabled
  entity Students as projection on studentApp.Students;
  entity Games as projection on studentApp.Games;
}