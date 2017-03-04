CREATE TABLE [documents] (
	id int NOT NULL,
	name varchar(45) NOT NULL,
	type int NOT NULL,
	description varchar(200) NOT NULL,
  CONSTRAINT [PK_DOCUMENTS] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [workers] (
	id int NOT NULL,
	name varchar(45) NOT NULL,
	surname varchar(45) NOT NULL,
	department_id int NOT NULL,
  CONSTRAINT [PK_WORKERS] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [departments] (
	hid hierarchyid NOT NULL,
	id int NOT NULL,
	name varchar(45) NOT NULL,
	chief varchar(45) NOT NULL,
	phone_number varchar(45) NOT NULL,
	doctypes_id varchar(45) NOT NULL,
  CONSTRAINT [PK_DEPARTMENTS] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [doctypes] (
	id int NOT NULL,
	name varchar(45) NOT NULL,
	department_id int NOT NULL,
  CONSTRAINT [PK_DOCTYPES] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
ALTER TABLE [documents] WITH CHECK ADD CONSTRAINT [documents_fk0] FOREIGN KEY ([type]) REFERENCES [doctypes]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [documents] CHECK CONSTRAINT [documents_fk0]
GO

ALTER TABLE [workers] WITH CHECK ADD CONSTRAINT [workers_fk0] FOREIGN KEY ([department_id]) REFERENCES [departments]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [workers] CHECK CONSTRAINT [workers_fk0]
GO


ALTER TABLE [doctypes] WITH CHECK ADD CONSTRAINT [doctypes_fk0] FOREIGN KEY ([department_id]) REFERENCES [departments]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [doctypes] CHECK CONSTRAINT [doctypes_fk0]
GO




