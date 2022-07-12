CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(50),
  date_of_birth DATE
);

CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  admitted_at TIMESTAMP,
  CONSTRAINT fk_patients FOREIGN KEY (patient_id) 
  REFERENCES patients(id),
  status VARCHAR(50)
);

CREATE TABLE invoices (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  paid_at TIMESTAMP,
  CONSTRAINT fk_medical_history FOREIGN KEY (medical_history_id) 
  REFERENCES medical_histories(id),
);

CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  type VARCHAR(50),
  name VARCHAR(50), 
);

CREATE TABLE invoice_items (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  CONSTRAINT fk_invoice FOREIGN KEY (invoice_id) 
  REFERENCES invoices(id),
  CONSTRAINT fk_treatments FOREIGN KEY (treatment_id) 
  REFERENCES treatments(id),
);

/* Join tables for medical histories and treatments tables*/
CREATE TABLE medical_treatments (
    medical_history_id INT, treatment_id INT,
    CONSTRAINT fk_medical FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id) ON DELETE CASCADE,
    CONSTRAINT fk_treatments FOREIGN KEY (treatment_id) REFERENCES treatments(id) ON DELETE CASCADE
);


