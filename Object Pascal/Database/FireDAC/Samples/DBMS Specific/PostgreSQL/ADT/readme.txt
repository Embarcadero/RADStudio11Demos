About
-------

FireDAC PostgreSQL is capable to recognize and read/write PostgreSQL composite types.
FireDAC will represent a table field of a composite type as an ftADT / TADTField. 
More about that:
http://docwiki.embarcadero.com/RADStudio/en/Connect_to_PostgreSQL_(FireDAC)
https://www.postgresql.org/docs/14/rowtypes.html

This demo demonstartes how to write and read ftADT fields. Please, see comments
in the application code.

Setup
-------

1) Run create.sql.
2) Open project and setup FDConnection1 according your environment.

Usage
-------

1) Run application.
2) Press "Open" button to read content of FDEmployees table.
3) Press "Edit" button to update 'salary' attribute of 'person' ftADT field.
4) Press "Write" button to insert new record into FDEmployees table.
