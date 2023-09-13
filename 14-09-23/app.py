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
    
# เส้นทาง API สำหรับดึงข้อมูลจากตาราง product_k รวมกับ product_k_detail พร้อมสี สวิตช์ และภาษา
@app.route('/products_k_with_detail', methods=['GET'])
def get_products_k_with_detail():
    try:
        cursor = mysql.connection.cursor()

        # ใช้ JOIN ระหว่างตาราง product_k และ product_k_detail โดยเชื่อมด้วย product_id
        cursor.execute("""
            SELECT k.product_id, k.product_name, k.product_price, k.product_quantity, k.product_image,
                   d.image_1, d.image_2, d.image_3, d.color, d.switch, d.language
            FROM product_k AS k
            LEFT JOIN product_k_detail AS d ON k.product_id = d.product_id
            WHERE k.product_quantity > 0
        """)

        products = cursor.fetchall()
        cursor.close()

        # สร้างโครงสร้าง JSON ใหม่
        product_dict = {}
        for product in products:
            product_id = product[0]
            if product_id not in product_dict:
                product_dict[product_id] = {
                    'product_id': product_id,
                    'product_name': product[1],
                    'product_price': float(product[2]),
                    'product_quantity': product[3],
                    'product_image': product[4],
                    'details': []
                }
            product_dict[product_id]['details'].append({
                'image_1': product[5],
                'image_2': product[6],
                'image_3': product[7],
                'color': product[8],
                'switch': product[9],
                'language': product[10]
            })

        # แปลงโครงสร้าง JSON ใหม่เป็นลิสต์ข้อมูล
        product_list = list(product_dict.values())

        return jsonify({'k_series_with_detail': product_list})

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

if __name__ == '__main__':
    app.run(debug=True)


if __name__ == '__main__':
    app.run(debug=True)

