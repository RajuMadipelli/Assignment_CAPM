using { ust.raju.madipelli.db } from '../db/datamodels';

service EmployeeService {

    entity EmployeeSet as projection on db.master.employees;
}