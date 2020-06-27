-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/V1VffI
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Employes] (
    [emp_no] int  NOT NULL ,
    [emp_title_id] varchar  NOT NULL ,
    [birth_date] date  NOT NULL ,
    [first_name] varchar(50)  NOT NULL ,
    [last_name] varchar(59)  NOT NULL ,
    [sex] varchar  NOT NULL ,
    [hire_date] date  NOT NULL ,
    CONSTRAINT [PK_Employes] PRIMARY KEY CLUSTERED (
        [emp_no] ASC,[emp_title_id] ASC
    )
)

CREATE TABLE [Salaries] (
    [emp_no] int  NOT NULL ,
    [salary] int  NOT NULL 
)

CREATE TABLE [Titles] (
    [titles_id] int  NOT NULL ,
    [title] varchar(50)  NOT NULL 
)

CREATE TABLE [Departments] (
    [dept_no] varchar  NOT NULL ,
    [dept_name] varchar(50)  NOT NULL ,
    CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

CREATE TABLE [DeptManager] (
    [dept_no] varchar  NOT NULL ,
    [emp_no] int  NOT NULL 
)

CREATE TABLE [DeptEmploye] (
    [emp_no] int  NOT NULL ,
    [dept_no] varchar  NOT NULL ,
    CONSTRAINT [PK_DeptEmploye] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

ALTER TABLE [Employes] WITH CHECK ADD CONSTRAINT [FK_Employes_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Salaries] ([emp_no])

ALTER TABLE [Employes] CHECK CONSTRAINT [FK_Employes_emp_no]

ALTER TABLE [Employes] WITH CHECK ADD CONSTRAINT [FK_Employes_emp_title_id] FOREIGN KEY([emp_title_id])
REFERENCES [Titles] ([titles_id])

ALTER TABLE [Employes] CHECK CONSTRAINT [FK_Employes_emp_title_id]

ALTER TABLE [Salaries] WITH CHECK ADD CONSTRAINT [FK_Salaries_emp_no] FOREIGN KEY([emp_no])
REFERENCES [DeptEmploye] ([emp_no])

ALTER TABLE [Salaries] CHECK CONSTRAINT [FK_Salaries_emp_no]

ALTER TABLE [Departments] WITH CHECK ADD CONSTRAINT [FK_Departments_dept_no] FOREIGN KEY([dept_no])
REFERENCES [DeptManager] ([dept_no])

ALTER TABLE [Departments] CHECK CONSTRAINT [FK_Departments_dept_no]

ALTER TABLE [DeptManager] WITH CHECK ADD CONSTRAINT [FK_DeptManager_emp_no] FOREIGN KEY([emp_no])
REFERENCES [DeptEmploye] ([emp_no])

ALTER TABLE [DeptManager] CHECK CONSTRAINT [FK_DeptManager_emp_no]

COMMIT TRANSACTION QUICKDBD