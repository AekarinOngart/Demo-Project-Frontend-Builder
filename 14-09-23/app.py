from flask import Flask, request, jsonify
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'keychronDB'

mysql = MySQL(app)

# ดึงข้อมูลสินค้าทั้งหมดของ product_k
@app.route('/products_k', methods=['GET'])
def get_products_k():
    try:
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM product_k WHERE product_quantity > 0") 
        products = cursor.fetchall()
        cursor.close()

        product_list = []
        for product in products:
            product_dict = {
                'product_id': product[0],
                'product_name': product[1],
                'product_price': float(product[2]),
                'product_quantity': product[3],
                'product_image': product[4]
            }
            product_list.append(product_dict)

        # เรียงข้อมูลตามลำดับ
        sorted_product_list = sorted(product_list, key=lambda x: x['product_id'])

        return jsonify({'k_series': sorted_product_list})

    except Exception as e:
        return jsonify({'error': str(e)}), 500

# ดึงข้อมูลสินค้าและรายละเอียดของ product_k ตาม ID
@app.route('/products_k/<int:product_id>', methods=['GET'])
def get_product_k_with_detail(product_id):
    try:
        cursor = mysql.connection.cursor()

        # ดึงข้อมูลจากตาราง product_k
        cursor.execute("SELECT * FROM product_k WHERE product_id = %s", (product_id,))
        product_k = cursor.fetchone()

        if not product_k:
            return jsonify({'message': 'ไม่พบสินค้า product_k ที่มี ID นี้'}), 404

        # ดึงข้อมูลจากตาราง product_k_detail สำหรับรายการสินค้านี้
        cursor.execute("SELECT * FROM product_k_detail WHERE product_id = %s", (product_id,))
        product_k_detail = cursor.fetchall()

        cursor.close()

        # เรียงลำดับ product_k_detail ตามคอลัมน์ id ในลำดับจากน้อยไปมาก
        product_k_detail_sorted = sorted(product_k_detail, key=lambda x: x[0])

        # สร้างข้อมูลผลลัพธ์ที่รวมข้อมูล product_k และ product_k_detail
        result = {
            'product_k': {
                'product_id': product_k[0],
                'product_name': product_k[1],
                'product_price': float(product_k[2]),
                'product_quantity': product_k[3],
                'product_image': product_k[4]
            },
            'product_k_detail': []
        }

        for detail in product_k_detail_sorted:
            product_detail = {
                'id': detail[0],
                'color': detail[1],
                'switch': detail[2],
                'language': detail[3],
                'quantity': detail[4],
                'image_1': detail[6],
                'image_2': detail[7],
                'image_3': detail[8]
            }
            result['product_k_detail'].append(product_detail)

        return jsonify(result)

    except Exception as e:
        return jsonify({'error': str(e)}), 500

# ดึงข้อมูลสินค้าทั้งหมดของ product_k_pro
@app.route('/products_k_pro', methods=['GET'])
def get_products_k_pro():
    try:
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM product_k_pro WHERE product_quantity > 0") 
        products = cursor.fetchall()
        cursor.close()

        product_list = []
        for product in products:
            product_dict = {
                'product_id': product[0],
                'product_name': product[1],
                'product_price': float(product[2]),
                'product_quantity': product[3],
                'product_image': product[4]
            }
            product_list.append(product_dict)

        # เรียงข้อมูลตามลำดับ
        sorted_product_list = sorted(product_list, key=lambda x: x['product_id'])

        return jsonify({'k_series_pro': sorted_product_list})

    except Exception as e:
        return jsonify({'error': str(e)}), 500

# ดึงข้อมูลสินค้าและรายละเอียดของ product_k_pro ตาม ID
@app.route('/products_k_pro/<int:product_id>', methods=['GET'])
def get_product_k_pro_with_detail(product_id):
    try:
        cursor = mysql.connection.cursor()

        # ดึงข้อมูลจากตาราง product_k_pro
        cursor.execute("SELECT * FROM product_k_pro WHERE product_id = %s", (product_id,))
        product_k_pro = cursor.fetchone()

        if not product_k_pro:
            return jsonify({'message': 'ไม่พบสินค้า product_k_pro ที่มี ID นี้'}), 404

        # ดึงข้อมูลจากตาราง product_k_pro_detail สำหรับรายการสินค้านี้
        cursor.execute("SELECT * FROM product_k_pro_detail WHERE product_id = %s", (product_id,))
        product_k_pro_detail = cursor.fetchall()

        cursor.close()

        # เรียงลำดับ product_k_pro_detail ตามคอลัมน์ id ในลำดับจากน้อยไปมาก
        product_k_pro_detail_sorted = sorted(product_k_pro_detail, key=lambda x: x[0])

        # สร้างข้อมูลผลลัพธ์ที่รวมข้อมูล product_k_pro และ product_k_pro_detail
        result = {
            'product_k_pro': {
                'product_id': product_k_pro[0],
                'product_name': product_k_pro[1],
                'product_price': float(product_k_pro[2]),
                'product_quantity': product_k_pro[3],
                'product_image': product_k_pro[4]
            },
            'product_k_pro_detail': []
        }

        for detail in product_k_pro_detail_sorted:
            product_detail = {
                'id': detail[0],
                'color': detail[1],
                'switch': detail[2],
                'language': detail[3],
                'quantity': detail[4],
                'image_1': detail[6],
                'image_2': detail[7],
                'image_3': detail[8]
            }
            result['product_k_pro_detail'].append(product_detail)

        return jsonify(result)

    except Exception as e:
        return jsonify({'error': str(e)}), 500

# ดึงข้อมูลสินค้าทั้งหมดของ product_q
@app.route('/products_q', methods=['GET'])
def get_products_q():
    try:
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM product_q WHERE product_quantity > 0") 
        products = cursor.fetchall()
        cursor.close()

        product_list = []
        for product in products:
            product_dict = {
                'product_id': product[0],
                'product_name': product[1],
                'product_price': float(product[2]),
                'product_quantity': product[3],
                'product_image': product[4]
            }
            product_list.append(product_dict)

        # เรียงข้อมูลตามลำดับ
        sorted_product_list = sorted(product_list, key=lambda x: x['product_id'])

        return jsonify({'q_series': sorted_product_list})

    except Exception as e:
        return jsonify({'error': str(e)}), 500

# ดึงข้อมูลสินค้าและรายละเอียดของ product_q ตาม ID
@app.route('/products_q/<int:product_id>', methods=['GET'])
def get_product_q_with_detail(product_id):
    try:
        cursor = mysql.connection.cursor()

        # ดึงข้อมูลจากตาราง product_q
        cursor.execute("SELECT * FROM product_q WHERE product_id = %s", (product_id,))
        product_q = cursor.fetchone()

        if not product_q:
            return jsonify({'message': 'ไม่พบสินค้า product_q ที่มี ID นี้'}), 404

        # ดึงข้อมูลจากตาราง product_q_detail สำหรับรายการสินค้านี้
        cursor.execute("SELECT * FROM product_q_detail WHERE product_id = %s", (product_id,))
        product_q_detail = cursor.fetchall()

        cursor.close()

        # เรียงลำดับ product_q_detail ตามคอลัมน์ id ในลำดับจากน้อยไปมาก
        product_q_detail_sorted = sorted(product_q_detail, key=lambda x: x[0])

        # สร้างข้อมูลผลลัพธ์ที่รวมข้อมูล product_q และ product_q_detail
        result = {
            'product_q': {
                'product_id': product_q[0],
                'product_name': product_q[1],
                'product_price': float(product_q[2]),
                'product_quantity': product_q[3],
                'product_image': product_q[4]
            },
            'product_q_detail': []
        }

        for detail in product_q_detail_sorted:
            product_detail = {
                'id': detail[0],
                'color': detail[1],
                'switch': detail[2],
                'language': detail[3],
                'quantity': detail[4],
                'image_1': detail[6],
                'image_2': detail[7],
                'image_3': detail[8]
            }
            result['product_q_detail'].append(product_detail)

        return jsonify(result)

    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
