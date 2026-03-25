[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "attendance_logs parquet_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared #"attendance_logs parquet" = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "4b58b49f-8f7d-46c9-8a1e-f1e347783e0a"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "4f2e745f-39c9-44a8-a15e-67e2e7c3ce06"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "Files", ItemKind = "Folder"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Name = "bronze"]}[Content],
  #"Navigation 4" = #"Navigation 3"{[Name = "attendance_logs.parquet"]}[Content],
  #"Imported Parquet" = Parquet.Document(#"Navigation 4"),
  #"Changed column type" = Table.TransformColumnTypes(#"Imported Parquet", {{"AbsenceCount", Int64.Type}}),
  #"Renamed columns" = Table.RenameColumns(#"Changed column type", {{"AbsenceCount", "AbsentDays"}}),
  #"Changed column type 1" = Table.TransformColumnTypes(#"Renamed columns", {{"Month", type date}})
in
  #"Changed column type 1";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "employee_details parquet_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared #"employee_details parquet" = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "4b58b49f-8f7d-46c9-8a1e-f1e347783e0a"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "4f2e745f-39c9-44a8-a15e-67e2e7c3ce06"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "Files", ItemKind = "Folder"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Name = "bronze"]}[Content],
  #"Navigation 4" = #"Navigation 3"{[Name = "employee_details.parquet"]}[Content],
  #"Imported Parquet" = Parquet.Document(#"Navigation 4"),
  #"Renamed columns" = Table.RenameColumns(#"Imported Parquet", {{"Emp ID", "EmployeeID"}}),
  #"Changed column type" = Table.TransformColumnTypes(#"Renamed columns", {{"Join Date", type date}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "employee_salaries xlsx parquet_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared #"employee_salaries xlsx parquet" = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "4b58b49f-8f7d-46c9-8a1e-f1e347783e0a"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "4f2e745f-39c9-44a8-a15e-67e2e7c3ce06"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "Files", ItemKind = "Folder"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Name = "bronze"]}[Content],
  #"Navigation 4" = #"Navigation 3"{[Name = "employee_salaries.xlsx.parquet"]}[Content],
  #"Imported Parquet" = Parquet.Document(#"Navigation 4"),
  #"Promoted headers" = Table.PromoteHeaders(#"Imported Parquet", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"Salary (USD)", type number}}),
  #"Renamed columns" = Table.RenameColumns(#"Changed column type", {{"Salary (USD)", "Salary"}})
in
  #"Renamed columns";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "performance_reviews parquet_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared #"performance_reviews parquet" = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "4b58b49f-8f7d-46c9-8a1e-f1e347783e0a"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "4f2e745f-39c9-44a8-a15e-67e2e7c3ce06"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "Files", ItemKind = "Folder"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Name = "bronze"]}[Content],
  #"Navigation 4" = #"Navigation 3"{[Name = "performance_reviews.parquet"]}[Content],
  #"Imported Parquet" = Parquet.Document(#"Navigation 4"),
  #"Changed column type" = Table.TransformColumnTypes(#"Imported Parquet", {{"Rating", type number}, {"Review_Date", type date}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "resignation_logs parquet_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared #"resignation_logs parquet" = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "4b58b49f-8f7d-46c9-8a1e-f1e347783e0a"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "4f2e745f-39c9-44a8-a15e-67e2e7c3ce06"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "Files", ItemKind = "Folder"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Name = "bronze"]}[Content],
  #"Navigation 4" = #"Navigation 3"{[Name = "resignation_logs.parquet"]}[Content],
  #"Imported Parquet" = Parquet.Document(#"Navigation 4"),
  #"Changed column type" = Table.TransformColumnTypes(#"Imported Parquet", {{"ResignationDate", type date}})
in
  #"Changed column type";
shared #"attendance_logs parquet_DataDestination" = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = null, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "4b58b49f-8f7d-46c9-8a1e-f1e347783e0a"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4f2e745f-39c9-44a8-a15e-67e2e7c3ce06"]}[Data],
  TableNavigation = Navigation_2{[Id = "attendance_logs parquet", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared #"employee_details parquet_DataDestination" = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = null, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "4b58b49f-8f7d-46c9-8a1e-f1e347783e0a"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4f2e745f-39c9-44a8-a15e-67e2e7c3ce06"]}[Data],
  TableNavigation = Navigation_2{[Id = "employee_details parquet", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared #"employee_salaries xlsx parquet_DataDestination" = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = null, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "4b58b49f-8f7d-46c9-8a1e-f1e347783e0a"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4f2e745f-39c9-44a8-a15e-67e2e7c3ce06"]}[Data],
  TableNavigation = Navigation_2{[Id = "employee_salaries xlsx parquet", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared #"performance_reviews parquet_DataDestination" = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = null, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "4b58b49f-8f7d-46c9-8a1e-f1e347783e0a"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4f2e745f-39c9-44a8-a15e-67e2e7c3ce06"]}[Data],
  TableNavigation = Navigation_2{[Id = "performance_reviews parquet", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared #"resignation_logs parquet_DataDestination" = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = null, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "4b58b49f-8f7d-46c9-8a1e-f1e347783e0a"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4f2e745f-39c9-44a8-a15e-67e2e7c3ce06"]}[Data],
  TableNavigation = Navigation_2{[Id = "resignation_logs parquet", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
