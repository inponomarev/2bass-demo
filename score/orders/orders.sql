create schema orders version '1.0';
-- *** TABLES ***
/**Заголовок счёта*/
CREATE TABLE OrderHeader(
  id VARCHAR(30) NOT NULL,
  date DATETIME,
  customer_id VARCHAR(30),
  
  /**Название клиента */
  customer_name VARCHAR(50),
  manager_id VARCHAR(30),
  CONSTRAINT Pk_OrderHeader PRIMARY KEY (id)
);

/**Строка счёта*/
CREATE TABLE OrderLine(
  order_id VARCHAR(30) NOT NULL,
  line_no INT NOT NULL,
  item_id VARCHAR(30) NOT NULL,
  item_name VARCHAR(100),
  qty INT NOT NULL DEFAULT 0,
  cost REAL NOT NULL DEFAULT 0.0,
  CONSTRAINT Idx_OrderLine PRIMARY KEY (order_id, line_no)
);

CREATE SEQUENCE test_id;

CREATE TABLE test (
  id INT NOT NULL DEFAULT NEXTVAL(test_id) PRIMARY KEY,
  desc VARCHAR(10)
);

-- *** FOREIGN KEYS ***
ALTER TABLE OrderLine ADD CONSTRAINT fk_OrderLine FOREIGN KEY (order_id) REFERENCES OrderHeader(id);
-- *** INDICES ***

-- *** VIEWS ***
create materialized view OrderedQty as
  select item_id, sum(qty) as qty from OrderLine group by item_id;
