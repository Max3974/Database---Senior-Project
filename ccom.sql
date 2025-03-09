-- something we need to keep in mind is accounting for null types
-- some fields are only applicable if a bool == true
-- relational databases can handle null types but it changes how queries work

-- with the fields for pdf/file, need to look into how to handle those datatypes, for now just a placeholder
-- arrays aren't really a thing in SQL, so additional tables might be the way to go
-- also need to come up with more descriptive 

CREATE TABLE "User" (
    "UserID" int  NOT NULL ,
    "Name" string  NOT NULL ,
    "Password" string  NOT NULL ,
    CONSTRAINT "pk_User" PRIMARY KEY (
        "UserID"
    )
)

GO

CREATE TABLE "Project" (
    "ProjectID" int  NOT NULL ,
    "PName" string  NOT NULL ,
    "PAccess" ARRAY  NOT NULL 
)

GO

CREATE TABLE "SectionA" (
    "ProjectID" int  NOT NULL ,
    "SigningOfficial" array NOT NULL ,
    "AdministrativeOfficial" array  NOT NULL 
)

GO

CREATE TABLE "SectionB" (
    "ProjectID" int  NOT NULL ,
    "Goals" text  NOT NULL ,
    "GoalsChange" bool  NOT NULL ,
    -- speicifc sections that could be broken up
    -- in accomplished if need be
    "Accomplished" pdf  NOT NULL ,
    "Revisions" bool  NOT NULL ,
    -- if bool = true
    "RevisionType" array NOT NULL ,
    -- training sections could be broken up
    "TrainingOps" pdf  NOT NULL ,
    "Results" text  NOT NULL ,
    "FuturePlans" text  NOT NULL 
)

GO

CREATE TABLE "SectionC" (
    "ProjectID" int  NOT NULL ,
    -- need to be able to put a manual entry (append array)
    "Publications" array NOT NULL ,
    -- same idea, append array
    "Sites" array NOT NULL ,
    -- has subsections that could be broken up (array of arrays)
    "Technologies" array NOT NULL ,
    "Inventions" bool  NOT NULL ,
    -- again has subsections
    "SigProducts" array NOT NULL 
)

GO

CREATE TABLE "SectionD" (
    "ProjectID" int  NOT NULL ,
    -- desciptions could be stored seperate or together
    "Individuals" array NOT NULL ,
    "EffortChange" bool  NOT NULL ,
    -- needs manual entry option
    "EffortLevel" array NOT NULL ,
    "NewPersonnel" bool  NOT NULL ,
    "PersonnelInfo" pdf  NOT NULL ,
    "SupportChange" bool  NOT NULL ,
    "SupportInfo" pdf  NOT NULL ,
    "NewContributors" bool  NOT NULL ,
    "ContributorInfo" pdf  NOT NULL ,
    "LeadershipChange" bool  NOT NULL ,
    "LeadershipInfo" pdf  NOT NULL 
)

GO

CREATE TABLE "SectionEF" (
    "ProjectID" int  NOT NULL ,
    "Impact" string  NOT NULL ,
    "ForiegnDollar" int  NOT NULL ,
    "Probelms" pf  NOT NULL 
)

GO

CREATE TABLE "SectionG" (
    "ProjectID" int  NOT NULL ,
    "SpecialNotice" pdf  NOT NULL ,
    "SiteChanges" array NOT NULL ,
    "ForeignComponent" array NOT NULL ,
    "ForeignDetails" string  NOT NULL ,
    "OverBudget" bool  NOT NULL ,
    "BudgetPercentage" int  NOT NULL ,
    "BudgetExplination" string  NOT NULL ,
    "OverBudgetUse" string  NOT NULL ,
    "ProgramIncome" bool  NOT NULL ,
    "SiteChange" string  NOT NULL 
)

GO

CREATE TABLE "SectionHIJ" (
    "ProjectID" int  NOT NULL ,
    -- just says attachment, could be something else
    "BudgetA" pdf  NOT NULL ,
    -- same deal with attachment
    "BudgetB" pdf  NOT NULL ,
    "Awards" string  NOT NULL ,
    "AdditionalDocs" pdf  NOT NULL 
)

GO

ALTER TABLE "User" ADD CONSTRAINT "fk_User_UserID" FOREIGN KEY("UserID")
REFERENCES "Project" ("PAccess")
GO

ALTER TABLE "SectionA" ADD CONSTRAINT "fk_SectionA_ProjectID" FOREIGN KEY("ProjectID")
REFERENCES "Project" ("ProjectID")
GO

ALTER TABLE "SectionB" ADD CONSTRAINT "fk_SectionB_ProjectID" FOREIGN KEY("ProjectID")
REFERENCES "Project" ("ProjectID")
GO

ALTER TABLE "SectionC" ADD CONSTRAINT "fk_SectionC_ProjectID" FOREIGN KEY("ProjectID")
REFERENCES "Project" ("ProjectID")
GO

ALTER TABLE "SectionD" ADD CONSTRAINT "fk_SectionD_ProjectID" FOREIGN KEY("ProjectID")
REFERENCES "Project" ("ProjectID")
GO

ALTER TABLE "SectionEF" ADD CONSTRAINT "fk_SectionEF_ProjectID" FOREIGN KEY("ProjectID")
REFERENCES "Project" ("ProjectID")
GO

ALTER TABLE "SectionG" ADD CONSTRAINT "fk_SectionG_ProjectID" FOREIGN KEY("ProjectID")
REFERENCES "Project" ("ProjectID")
GO

ALTER TABLE "SectionHIJ" ADD CONSTRAINT "fk_SectionHIJ_ProjectID" FOREIGN KEY("ProjectID")
REFERENCES "Project" ("ProjectID")
GO

CREATE INDEX "idx_User_Name"
ON "User" ("Name")
GO