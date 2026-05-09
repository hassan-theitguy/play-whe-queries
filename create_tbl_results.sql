CREATE TABLE DrawResults (
    DrawNo INTEGER PRIMARY KEY,
    DrawDate DATE,
    ResultNo INTEGER CHECK (ResultNo BETWEEN 1 AND 36),
    DrawTime INTEGER CHECK (DrawTime BETWEEN 1 AND 4)
);
