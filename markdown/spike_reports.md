Title: spike_reports
Author: Alex Sonneveld
Base Header Level: 1

# 1	Spike #

> A Spike is an agile software engineering practice used to overcome some gap in knowledge or skills. In these cases it is difficult to build a plan or design in which you can have much confidence. The aim of the spike is to overcome these issues as quickly as possible.
>
> When performing a Spike you build the smallest possible core solution in the shortest possible time that can then be used to inform your progress using that technology/domain etc. The idea of the spike is to determine how the project should proceed.
>
> -- <cite>Quote from [SwinBrain ICT Spike][]</cite>

[SwinBrain ICT Spike]: http://swinbrain.ict.swin.edu.au/wiki/Spike

----

# 2	Templates #

## 2.1	Spike Plan ##

----------
**Name**:

### 2.1.1	Context: ###

Outline the reason and context for the spike.

Example: Team needs to use a database to store data for application developed during this subject and must learn to use the Firebird DBMS tools to be able to script the creation and population of the database.

Knowledge Gap
: Learn about Firebird DBMS tools

Skill Gap
: Is able to use Firebird DBMS tools effective

Technology Gap
:  Firebird DBMS tools

Provide details of the appropriate gaps related to this spike.

Example: The team is not familiar with the Firebird DBMS that has been chosen by the subject conveners. Need to install and make use of the following tools for Firebird:

- FSQL command line tool
- FlameRobin GUI admin tool

### 2.1.2	Goals/Deliverables: ###

What are the goals and deliverables of this spike?
Example:

- Scripts need to create database that models the application domain
- Scripts to insert initial test data into the database
- Batch file, makefile or MSBuild script that includes database setup and tear down

**Planned start date:**  Example: 13/08/2007
**Deadline:**  Example: 20/08/2007

### 2.1.3	Planning notes: ###

Outline a proposed plan of how this spike can be undertaken.

Example:

- Design database tables for the team’s application domain.
- Install and configure fsql and flamerobin with embedded Firebird driver if required
- Create scripts to construct the database tables
- Create scripts to populate the database tables with initial test data
- Create scripts to tear down database
- Create batch/makefile/build script with two targets, one to construct and populate (setup) the database, and the other to tear down the database.

## 2.2	Spike Outcome ##

-----------------
**Spike:** Spike_No
**Title:** Spike_Title
**Author:** Alex Sonneveld, 7193475@student.swin.edu.au

### 2.2.1	Goals / Deliverables: ###

_#### Summarise from the spike plan goal_
_#### Besides this report, what else was created ie UML, code, reports_

- Code see /spikes/spike04/
- Short Report titled “IDE Comparison”
- …

### 2.2.2	Technologies, Tools, and Resources used: ###

_#### List of information needed by someone trying to reproduce this work_

- Game Engine; Unity (4.1.3)
- Integrated Developer Environment (IDE); Xcode 5
- Internet Browser; Google Chrome
- Text Editor:
    - Atom,
    - Mou (0.8.5 beta), and
    - Sublime Text 2
- Word processor; Microsoft Word 2013

### 2.2.3	Tasks undertaken: ###

#### List key tasks likely to help another developer
- …

### 2.2.4	What we found out: ###

#### Describe (sentences), + graphs/screenshots/outcomes as needed

### 2.2.5	Open issues/risks _[Optional – remove heading/section if not used!]_: ###

_#### List out the issues and risks that you have been unable to resolve at the end of the spike. You may have uncovered a whole range of new risks as well. Make notes to help the team manage and respond._

- e.g. Risk xyz (new)

### 2.2.6	Recommendations _[Optional – remove heading/section if not used!]_: ###

_### Often based on any open issues/risks Identified. You may state that another spike is required for the team to resolve new issues identified (or) indicate that this spike has increased the teams confidence in XYZ and should move on._

- e.g. Recommendation X: