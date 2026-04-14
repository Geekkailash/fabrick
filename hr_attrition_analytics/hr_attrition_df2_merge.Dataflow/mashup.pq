[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared #"employee_details parquet" = let
  Source = Lakehouse.Contents([HierarchicalNavigation = null]),
  #"Navigation 1" = Source{[workspaceId = "4b58b49f-8f7d-46c9-8a1e-f1e347783e0a"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[lakehouseId = "4f2e745f-39c9-44a8-a15e-67e2e7c3ce06"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Id = "employee_details parquet", ItemKind = "Table"]}[Data]
in
  #"Navigation 3";
shared #"employee_salaries xlsx parquet" = let
  Source = Lakehouse.Contents([HierarchicalNavigation = null]),
  #"Navigation 1" = Source{[workspaceId = "4b58b49f-8f7d-46c9-8a1e-f1e347783e0a"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[lakehouseId = "4f2e745f-39c9-44a8-a15e-67e2e7c3ce06"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Id = "employee_salaries xlsx parquet", ItemKind = "Table"]}[Data]
in
  #"Navigation 3";
shared emp_Sal = let
  Source = Table.NestedJoin(#"employee_details parquet", {"EmployeeID"}, #"employee_salaries xlsx parquet", {"Emp ID"}, "employee_salaries xlsx parquet", JoinKind.LeftOuter),
  #"Expanded employee_salaries xlsx parquet" = Table.ExpandTableColumn(Source, "employee_salaries xlsx parquet", {"Salary"}, {"Salary"})
in
  #"Expanded employee_salaries xlsx parquet";
shared emp_Salary = let
  Source = emp_Sal
in
  Source;
shared #"attendance_logs parquet" = let
  Source = Lakehouse.Contents([HierarchicalNavigation = null]),
  #"Navigation 1" = Source{[workspaceId = "4b58b49f-8f7d-46c9-8a1e-f1e347783e0a"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[lakehouseId = "4f2e745f-39c9-44a8-a15e-67e2e7c3ce06"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Id = "attendance_logs parquet", ItemKind = "Table"]}[Data]
in
  #"Navigation 3";
shared #"performance_reviews parquet" = let
  Source = Lakehouse.Contents([HierarchicalNavigation = null]),
  #"Navigation 1" = Source{[workspaceId = "4b58b49f-8f7d-46c9-8a1e-f1e347783e0a"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[lakehouseId = "4f2e745f-39c9-44a8-a15e-67e2e7c3ce06"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Id = "performance_reviews parquet", ItemKind = "Table"]}[Data]
in
  #"Navigation 3";
shared #"resignation_logs parquet" = let
  Source = Lakehouse.Contents([HierarchicalNavigation = null]),
  #"Navigation 1" = Source{[workspaceId = "4b58b49f-8f7d-46c9-8a1e-f1e347783e0a"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[lakehouseId = "4f2e745f-39c9-44a8-a15e-67e2e7c3ce06"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Id = "resignation_logs parquet", ItemKind = "Table"]}[Data]
in
  #"Navigation 3";
shared emp_salr_att = let
  Source = Table.NestedJoin(emp_Salary, {"EmployeeID"}, #"attendance_logs parquet", {"Emp ID"}, "attendance_logs parquet", JoinKind.LeftOuter),
  #"Expanded attendance_logs parquet" = Table.ExpandTableColumn(Source, "attendance_logs parquet", {"Month", "AbsentDays"}, {"Month", "AbsentDays"})
in
  #"Expanded attendance_logs parquet";
shared emp_sal_perf = let
  Source = Table.NestedJoin(emp_salr_att, {"EmployeeID"}, #"performance_reviews parquet", {"Emp ID"}, "performance_reviews parquet", JoinKind.LeftOuter),
  #"Expanded performance_reviews parquet" = Table.ExpandTableColumn(Source, "performance_reviews parquet", {"Review_Date", "Rating"}, {"Review_Date", "Rating"})
in
  #"Expanded performance_reviews parquet";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Merge_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared Merge = let
  Source = Table.NestedJoin(emp_sal_perf, {"EmployeeID"}, #"resignation_logs parquet", {"Emp ID"}, "resignation_logs parquet", JoinKind.LeftOuter),
  #"Expanded resignation_logs parquet" = Table.ExpandTableColumn(Source, "resignation_logs parquet", {"ResignationDate", "ResignationReason"}, {"ResignationDate", "ResignationReason"})
in
  #"Expanded resignation_logs parquet";
shared Merge_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = null, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "4b58b49f-8f7d-46c9-8a1e-f1e347783e0a"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4f2e745f-39c9-44a8-a15e-67e2e7c3ce06"]}[Data],
  TableNavigation = Navigation_2{[Id = "final_gold", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
