# NOTE :- In this context, it's important to note that the table names used in the examples include underscores and numbers, 
# which differ from the naming conventions used in the LeetCode problem.

Create table If Not Exists Activities_31 (
sell_date date, 
product varchar(20)
);

Truncate table Activities_31;

insert into Activities_31 (sell_date, product) values ('2020-05-30', 'Headphone');
insert into Activities_31 (sell_date, product) values ('2020-06-01', 'Pencil');
insert into Activities_31 (sell_date, product) values ('2020-06-02', 'Mask');
insert into Activities_31 (sell_date, product) values ('2020-05-30', 'Basketball');
insert into Activities_31 (sell_date, product) values ('2020-06-01', 'Bible');
insert into Activities_31 (sell_date, product) values ('2020-06-02', 'Mask');
insert into Activities_31 (sell_date, product) values ('2020-05-30', 'T-Shirt');

/*
Q. Write a solution to find for each date the number of different products sold and their names.
The sold products names for each date should be sorted lexicographically.
Return the result table ordered by sell_date.

Input: 
Activities table:
+------------+------------+
| sell_date  | product     |
+------------+------------+
| 2020-05-30 | Headphone  |
| 2020-06-01 | Pencil     |
| 2020-06-02 | Mask       |
| 2020-05-30 | Basketball |
| 2020-06-01 | Bible      |
| 2020-06-02 | Mask       |
| 2020-05-30 | T-Shirt    |
+------------+------------+
Output: 
+------------+----------+------------------------------+
| sell_date  | num_sold | products                     |
+------------+----------+------------------------------+
| 2020-05-30 | 3        | Basketball,Headphone,T-shirt |
| 2020-06-01 | 2        | Bible,Pencil                 |
| 2020-06-02 | 1        | Mask                         |
+------------+----------+------------------------------+
Explanation: 
For 2020-05-30, Sold items were (Headphone, Basketball, T-shirt), we sort them lexicographically and separate them by a comma.
For 2020-06-01, Sold items were (Pencil, Bible), we sort them lexicographically and separate them by a comma.
For 2020-06-02, the Sold item is (Mask), we just return it.
*/

SELECT * FROM Activities_31;

SELECT sell_date, COUNT(product) AS num_sold, GROUP_CONCAT(DISTINCT product) AS products
FROM Activities_31
GROUP BY sell_date
ORDER BY sell_date;
