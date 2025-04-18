-- Insert test users
INSERT INTO "User" ("UserID", "Name", "Password") VALUES
(1, 'John Smith', 'password123'),
(2, 'Jane Doe', 'securepass456'),
(3, 'Robert Johnson', 'admin789');

-- Insert test projects
INSERT INTO "Project" ("ProjectID", "PName", "PAccessID") VALUES
(101, 'Quantum Computing Research', 1),
(102, 'AI Ethics Framework', 2),
(103, 'Renewable Energy Storage', 3);

-- Insert officials
INSERT INTO "Officials" ("OName", "OfficialID") VALUES
('Dr. Alice Williams', 1001),
('Prof. Michael Brown', 1002),
('Dr. Sarah Chen', 1003);

-- Insert Section A data
INSERT INTO "SectionA" ("ProjectID", "SigningOfficial", "AdministrativeOfficial") VALUES
(101, 'Dr. Alice Williams', 'Prof. Michael Brown'),
(102, 'Dr. Sarah Chen', 'Dr. Alice Williams'),
(103, 'Prof. Michael Brown', 'Dr. Sarah Chen');

-- Insert technologies
INSERT INTO "Technologies" ("TName", "TechID", "Description") VALUES
('Quantum Annealing', 2001, 'Quantum computing technique for optimization problems'),
('Neural Networks', 2002, 'Machine learning architecture inspired by biological neurons'),
('Solid-State Batteries', 2003, 'Energy storage technology using solid electrodes');

-- Insert sites
INSERT INTO "Sites" ("SName", "SiteID") VALUES
('Main Campus Lab', 3001),
('Field Research Station', 3002),
('Collaborator Facility', 3003);

-- Create tables for array-type fields
CREATE TABLE "SectionB_RevisionTypes" (
    "ProjectID" int NOT NULL,
    "RevisionType" text NOT NULL,
    FOREIGN KEY ("ProjectID") REFERENCES "Project" ("ProjectID")
);

CREATE TABLE "SectionC_SigProducts" (
    "ProjectID" int NOT NULL,
    "ProductName" text NOT NULL,
    "ProductDescription" text,
    FOREIGN KEY ("ProjectID") REFERENCES "Project" ("ProjectID")
);

CREATE TABLE "SectionG_SiteChanges" (
    "ProjectID" int NOT NULL,
    "ChangeDescription" text NOT NULL,
    FOREIGN KEY ("ProjectID") REFERENCES "Project" ("ProjectID")
);

CREATE TABLE "SectionG_ForeignComponents" (
    "ProjectID" int NOT NULL,
    "ComponentName" text NOT NULL,
    "Country" text NOT NULL,
    FOREIGN KEY ("ProjectID") REFERENCES "Project" ("ProjectID")
);

-- Insert Section B data
INSERT INTO "SectionB" ("ProjectID", "Goals", "GoalsChange", "Accomplished", "Revisions", "TrainingOps", "Results", "FuturePlans") VALUES
(101, 'Develop quantum algorithms for optimization', 0, 'Completed initial simulations', 1, 'Quantum computing workshop', 'Successful prototype', 'Scale up to larger systems'),
(102, 'Create ethical guidelines for AI deployment', 1, 'Drafted initial framework', 0, 'Ethics training sessions', 'Framework v1.0 completed', 'Industry adoption'),
(103, 'Improve energy density of storage systems', 0, 'Tested new materials', 1, 'Materials science seminar', '20% improvement achieved', 'Commercial prototype');

-- Insert revision types (for Section B)
INSERT INTO "SectionB_RevisionTypes" ("ProjectID", "RevisionType") VALUES
(101, 'Changed optimization parameters'),
(101, 'Added new constraints'),
(103, 'Modified material composition');

-- Insert Section C data
INSERT INTO "SectionC" ("ProjectID", "Publications", "Sites", "Technologies", "Inventions", "SigProducts") VALUES
(101, 'Quantum Optimization Methods, Journal of QC, 2023', 'Main Campus Lab; Collaborator Facility', 'Quantum Annealing', 1, 'Quantum optimizer v1.0'),
(102, 'Ethical AI Framework, AI Ethics Review, 2023', 'Main Campus Lab', 'Neural Networks', 0, 'AI Ethics Checklist'),
(103, 'Advanced Battery Materials, Energy Journal, 2023', 'Field Research Station; Collaborator Facility', 'Solid-State Batteries', 1, 'High-density battery prototype');

-- Insert significant products (for Section C)
INSERT INTO "SectionC_SigProducts" ("ProjectID", "ProductName", "ProductDescription") VALUES
(101, 'Quantum optimizer v1.0', 'Software for quantum optimization problems'),
(101, 'Qubit calibration tool', 'Utility for maintaining quantum coherence'),
(103, 'High-density battery prototype', 'Solid-state battery with improved capacity'),
(103, 'Thermal management system', 'For maintaining optimal battery temperature');

-- Insert Section D data
INSERT INTO "SectionD" ("ProjectID", "Individuals", "EffortChange", "EffortLevel", "EffortPercent", "NewPersonnel", "PersonnelInfo", "SupportChange", "SupportInfo", "NewContributors", "ContributorInfo", "LeadershipChange", "LeadershipInfo") VALUES
(101, 'Dr. Lee (PI), Dr. Garcia (Co-PI)', 1, 'Increased', 40, 1, 'Hired 2 postdocs for quantum programming', 0, 'Same support staff', 1, 'Added IBM Quantum as collaborator', 0, 'No change'),
(102, 'Prof. Taylor (PI), Dr. Martin (Researcher)', 0, 'Steady', 30, 0, 'No new hires', 1, 'Added ethics review board', 0, 'No new contributors', 1, 'Added deputy PI'),
(103, 'Dr. Wilson (PI), 3 grad students', 1, 'Decreased', 25, 1, 'One grad student graduated', 1, 'Reduced lab space', 1, 'Added industry partner', 0, 'No change');

-- Insert Section EF data
INSERT INTO "SectionEF" ("ProjectID", "Impact", "ForiegnDollar", "Probelms") VALUES
(101, 'Potential to revolutionize logistics industry', 50000, 'Qubit decoherence issues'),
(102, 'Critical for responsible AI development', 0, 'Balancing innovation with constraints'),
(103, 'Could enable renewable energy adoption', 20000, 'Manufacturing scalability');

-- Insert Section G data
INSERT INTO "SectionG" ("ProjectID", "SpecialNotice", "ForeignDetails", "OverBudget", "BudgetPercentage", "BudgetExplination", "OverBudgetUse", "ProgramIncome", "SiteChange") VALUES
(101, 'Proprietary algorithms developed', 'Collaboration with Canadian quantum lab', 1, 15, 'Unexpected equipment costs', 'Additional qubit controllers', 0, 'Added cryogenics facility'),
(102, 'Open source framework', 'No foreign components', 0, 0, 'On budget', 'N/A', 1, 'No changes'),
(103, 'Patent pending', 'Materials sourced from Germany', 0, 0, 'On budget', 'N/A', 0, 'Expanded testing lab');

-- Insert site changes (for Section G)
INSERT INTO "SectionG_SiteChanges" ("ProjectID", "ChangeDescription") VALUES
(101, 'Added cryogenics facility for qubit stability'),
(103, 'Expanded testing lab capacity by 30%');

-- Insert foreign components (for Section G)
INSERT INTO "SectionG_ForeignComponents" ("ProjectID", "ComponentName", "Country") VALUES
(101, 'Quantum processor', 'Canada'),
(103, 'Solid electrolyte materials', 'Germany');

-- Insert Section HIJ data
INSERT INTO "SectionHIJ" ("ProjectID", "BudgetA", "BudgetB", "Awards", "AdditionalDocs") VALUES
(101, 'budget_qc_2023.pdf', 'expenses_qc_2023.pdf', 'NSF Quantum Grant', 'patent_application.pdf'),
(102, 'budget_ai_2023.pdf', 'expenses_ai_2023.pdf', 'Ethics in Tech Award', 'framework_license.pdf'),
(103, 'budget_energy_2023.pdf', 'expenses_energy_2023.pdf', 'DOE Energy Innovation', 'material_specs.pdf');