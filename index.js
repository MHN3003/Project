const express =require("express");
const mysql=require("mysql");
const bodyParser = require('body-parser');
const port =process.env.PORT || 5009
const app=express();
const ejs = require("ejs");
const path=require("path");
const session = require("express-session"); 
const fs=require('fs');
const cookieParser = require('cookie-parser');
const { log } = require("console");

// Set up session middleware
app.use(session({
  secret: 'your_secret_key',  // Replace with your own secret
  resave: false,
  saveUninitialized: true
}));

// User Middleware to set user variable
app.use((req, res, next) => {
  res.locals.user = req.session.user || null;
  next();
});
app.use(cookieParser());

app.engine('html',ejs.__express);
app.use(express.static(path.join(__dirname,"public")));
app.set("view engine","html");
app.set(express.static(path.join(__dirname,"views")));

const connection = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'',
    database:'miinkglow'
})

// Middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('public'));

// Routes


app.get('/login', (req, res) => {
  const message = req.query.message || null;
  res.render('login', { message });
  });
 
  app.get('/admin', (req, res) => {
    res.render('admin');
  });
app.get('/admindashboard', (req, res) => {
    res.render('admindashboard');
  });
  app.get('/signup', (req, res) => {
    res.render('signup');
  });
  app.get('/userprofile', (req, res) => {
    res.render('userprofile');
  });
  // app.get('/checkout', (req, res) => {
  //   res.render('checkout');
  // });

  app.get("/", (req, res) => {
    connection.connect((err) => {
      // if (err) {
      //     console.error('Error connecting to database:', err);
      //     return;
      // }

      console.log('Connected to database');
  });
    const PAGE_SIZE = 12; // Number of products per page
 
    // Query to fetch regular products
    const fetchProducts = new Promise((resolve, reject) => {
        connection.query(`SELECT * FROM product LIMIT ${PAGE_SIZE}`, (err, results) => {
            if (err) {
                return reject(err);
            }
            resolve(results);
        });
    });

    // Query to fetch new products
    const fetchNewProducts = new Promise((resolve, reject) => {
        const isnew = 'TRUE';
        connection.query('SELECT * FROM product WHERE isnew = ?', [isnew], (err, results) => {
            if (err) {
                return reject(err);
            }
            resolve(results);
        });
    });
    const fetchrecs = new Promise((resolve, reject) => {
      const isrec = 'TRUE';
      connection.query('SELECT * FROM product WHERE exist = ?', [isrec], (err, results) => {
          if (err) {
              return reject(err);
          }
          resolve(results);
      });
  });

    // Fetch both regular products and new products
    Promise.all([fetchProducts, fetchNewProducts, fetchrecs])
        .then(([products, newProducts, recs]) => {
            // Pass both sets of products to the EJS template
            res.render("index", { products, newProducts, recs });
            
        })
        .catch(err => {
            console.error('Error fetching products:', err);
            res.status(500).send('Internal Server Error');
        });
});

app.get('/shopall', async (req, res) => {
  const page = req.query.page || 1;
  const perPage = 20;
  const offset = (page - 1) * perPage;

  try {
      const query = 'SELECT * FROM product LIMIT ?, ?';
      connection.query(query, [offset, perPage], (error, results, fields) => {
          if (error) {
              console.error('Error executing SQL query: ' + error.stack);
              res.status(500).send('Server Error');
              return;
          }
          
          // Get total number of products for pagination
          connection.query('SELECT COUNT(*) AS total FROM product', (err, totalProducts) => {
              if (err) {
                  console.error('Error executing SQL query: ' + err.stack);
                  res.status(500).send('Server Error');
                  return;
              }
              const totalPages = Math.ceil(totalProducts[0].total / perPage);
              res.render('shopall', { products: results, totalPages, currentPage: page });
          });
      });
  } catch (err) {
      console.error('Error: ' + err.stack);
      res.status(500).send('Server Error');
  }
});

// Route to get product details along with related products
app.get('/product_detail', (req, res) => {
  // Query to get all products
  const prod = req.query.id;
  connection.query('SELECT * FROM product  WHERE proID = ?', [prod],(err, productsResult) => {
    if (err) {
      console.error('Error fetching products:', err);
      res.sendStatus(500);
      return;
    }

    // Function to fetch pairs for all products
    connection.query(
      `SELECT p1.proID AS productID, p1.name AS productName, p1.image AS productImage,
              p2.proID AS pairID, p2.name AS pairName, p2.image AS pairImage
       FROM product_pairs pp
       JOIN product p1 ON pp.product_id = p1.proID
       JOIN product p2 ON pp.pairs_with_id = p2.proID`,
      (err, pairsResult) => {
        if (err) {
          console.error('Error fetching pairs:', err);
          res.sendStatus(500);
          return;
        }

        res.render('product_detail', { products: productsResult, pairs: pairsResult });
      }
    );
  });
});

function updateAverageRatings() {
  // SQL query to calculate average ratings
  const sql = `
    UPDATE product AS p
    SET p.rating = (
      SELECT AVG(r.rating)
      FROM ratings AS r
      WHERE r.product_id = p.proID
    )
  `;

  // Execute the SQL query
  connection.query(sql, (err, result) => {
    if (err) {
      console.error('Error updating average ratings:', err);
      return;
    }
    console.log('Average ratings updated successfully');
  });
}

// Call the function to update average ratings whenever necessary
// For example, after a new rating is submitted or updated
updateAverageRatings();

app.post('/submit-rating', isAuthenticated, (req, res) => {
  const { rating, description, productId } = req.body; 
  const userId = req.session.userId;

  // Insert data into MySQL database
  const sql = 'INSERT INTO ratings (rating, experience, product_id, user_id) VALUES (?, ?, ?, ?)';
  connection.query(sql, [rating, description, productId, userId], (err, result) => {
    if (err) {
      console.error('Error inserting data into MySQL:', err);
      res.status(500).send('Error submitting rating');
      return;
    }
    console.log('Rating submitted successfully');
    res.send('Rating submitted successfully');
  });
});



app.post('/signup', (req, res) => {
    
    const { username, firstname, lastname, gender, birthdate, email, Password, cpassword } = req.body;
    const sql = 'INSERT INTO client (username, email, password,clientfirstname,clientlastname,gender,birthdate) VALUES (?, ?, ?,?,?, ?, ?)';
    connection.query(sql, [username, email, Password, firstname, lastname, gender, birthdate ], (err, result) => {
      if (err) {
        console.log(err);
        res.redirect('/');
      } 
      else if(cpassword !== Password){
        res.send('posswords do not match');
        console.log('posswords do not match');
      }
      else {
        res.send('Successfully signed up!');
        console.log('User signed up');
      }
    });
  });

  app.post('/login', (req, res) => {
    const { email, password } = req.body;
    const sql = 'SELECT * FROM client WHERE email = ? AND password = ?';
    
    if (email === 'admin@gmail.com' && password === 'admin123') {
      req.session.user = { email, role: 'admin' }; // Save session
      res.redirect('/admin');
      return; // Stop further execution
    }

    connection.query(sql, [email, password], (err, results) => {
      if (err) {
        console.log(err);
        res.redirect('/login?message=login failed.');
      } else {
        if (results.length > 0) {
          console.log('Login successful!');
          const user = results[0]; // Assuming only one user with given email/password
          req.session.userId = user.idC; // Store user's ID in session
          req.session.user = user; // Store user's information in session
          res.redirect('/userprofile'); // Redirect to profile page or desired page
        } else {
          res.redirect('/login?message=Error: login failed!');
        }
      }
    });
  });
  
  app.use((req, res, next) => {
    res.locals.user = req.session.user || null;
    next();
  });
  
  app.get('/userprofile', (req, res) => {
    const userId = req.session.userId; // Get user's ID from session
    if (!userId) {
      // Handle case where user is not logged in
      res.redirect('/login');
      return;
    }
  
    // Fetch user's information from the database using userId
    const sql = 'SELECT * FROM client WHERE idC = ?';
    connection.query(sql, [userId], (err, results) => {
      if (err) {
        console.log(err);
        res.redirect('/login');
      } else {
        if (results.length > 0) {
          const user = results[0];
          res.render('userprofile', { user }); // Pass user's information to profile page
        } else {
          // Handle case where user with given ID is not found
          res.redirect('/login');
        }
      }
    });
  });
  

 app.get('/profile', (req, res) => {
  // Assuming you have stored the admin data in some variable or retrieved it from the database
  const adminData = {
    name:'Merdas Haifa',
    email: 'admin@gmail.com',
    // Add other admin data here as needed
  };

  // Render the profile page with admin data
  res.render('profile', { userData: adminData });
});

app.post('/logout', (req, res) => {
  // Redirect to the login page after logout
  res.redirect('/login');
});
app.listen(port,()=>{
    console.log("server is online");
});
// Serve categories
app.get('/categories', (req, res) => {
  try {
      const query = 'SELECT category FROM category';
      connection.query(query, (error, results) => {
          if (error) {
              console.error('Error fetching categories:', error);
              res.status(500).json({ error: 'Internal Server Error' });
          } else {
              res.json(results);
          }
      });
  } catch (err) {
      console.error('Error fetching categories:', err);
      res.status(500).json({ error: 'Internal Server Error' });
  }
});

app.get('/skintypes', (req, res) => {
  try {
      const query = 'SELECT skintype FROM skintype'; // Assuming 'skintype' is the table name
      connection.query(query, (error, results) => {
          if (error) {
              console.error('Error fetching skin types:', error);
              res.status(500).json({ error: 'Internal Server Error' });
          } else {
              res.json(results);
          }
      });
  } catch (err) {
      console.error('Error fetching skin types:', err);
      res.status(500).json({ error: 'Internal Server Error' });
  }
});

app.get('/skinconcerns', (req, res) => {
  try {
      const query = 'SELECT skinConcerns FROM skinconcerns'; // Assuming 'skinconcerns' is the table name
      connection.query(query, (error, results) => {
          if (error) {
              console.error('Error fetching skin concerns:', error);
              res.status(500).json({ error: 'Internal Server Error' });
          } else {
              res.json(results);
          }
      });
  } catch (err) {
      console.error('Error fetching skin concerns:', err);
      res.status(500).json({ error: 'Internal Server Error' });
  }
});

app.post('/addproducts', (req, res) => {
  const { name, description, price,category, image,volume,instructions,ingredients,skinconcerns,skintype,detail1,detail2,detail3,isnew } = req.body;
  const sql = 'INSERT INTO product (name, description, price,category,image,volume,instructions,ingredients,skinConcerns,skintype,detail1,detail2,detail3,isnew) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)';
  connection.query(sql, [name, description, price,category, image,volume,instructions,ingredients,skinconcerns,skintype,detail1,detail2,detail3,isnew], (err, result) => {
    if (err) {
      console.log(err);
      res.redirect('/addproducts?message=Error adding product.');
    } 
    else {
     console.log('product added');
     res.redirect('/addproducts?message=Product added successfully!');
    }
  });
});

app.get('/addproducts', (req, res) => {
  const message = req.query.message || null;
  res.render('addproducts', { message });
});

// Render product list page
app.get('/productslist', (req, res) => {
  // Fetch list of all products from the database

  connection.query('SELECT * FROM product', (err, rows) => {
      if (err) {
          console.error('Error fetching product list:', err);
          res.status(500).send('Internal Server Error');
      } else {
          // Render the productlist.ejs template with product list
          res.render('productslist', { products: rows });
      }
  });
});

// Render edit product page
app.get('/editproducts', (req, res) => {
  const message = req.query.message || null;
  const productId = req.query.id;
    connection.query('SELECT * FROM product WHERE proID = ?', [productId], (err, rows) => {
        if (err) {
            console.error('Error fetching product details:', err);
            res.status(500).send('Internal Server Error');
        } else {
            if (rows.length > 0) {
                console.log('Product details:', rows[0]); // Log product details
                res.render('editproducts', { product: rows[0], message });
            } else {
                res.status(404).send('Product not found');
            }
        }
    });
});

// Handle form submission to update product
app.post('/editproducts/:id', (req, res) => {
  const productId = req.params.id; // Corrected to use params instead of query
  const { name, description, volume, instructions, ingredients,image, price,skinconcerns,skintype,detail1,detail2,detail3,isnew } = req.body;
  connection.query(
      'UPDATE product SET name = ?, description = ?, price = ?, volume = ?, image = ?, ingredients = ?, instructions = ? ,skinconcerns = ? ,skintype = ? ,detail1 = ? ,detail2 = ? ,detail3 = ? , isnew  = ? WHERE proID = ?',
      [name, description, price, volume, image, ingredients, instructions, skinconcerns,skintype,detail1,detail2,detail3,isnew,productId],
      (err, result) => {
          if (err) {
            console.error('Error updating product:', err);
            res.redirect(`/editproducts?id=${productId}&message=Error updating product.`);
            // res.redirect('/editproducts?message=Error adding product.');
          } else {
            res.redirect(`/editproducts?id=${productId}&message=Product updated successfully!`);
              // res.redirect('/editproducts?message=Product added successfully!');
              console.log('updated product');
          }
      }
  );
});

app.get('/deleteproduct/:id', (req, res) => {
  const productId = req.params.id;

  connection.query('DELETE FROM product WHERE proID = ?', [productId], (err, result) => {
      if (err) {
          console.error('Error deleting product:', err);
          res.redirect('/productslist');
      } else {
          res.redirect('/productslist');
      }
  });
});

app.get('/productslist', (req, res) => {
  connection.query('SELECT * FROM product', (err, rows) => {
      if (err) {
          console.error('Error fetching products:', err);
          res.status(500).send('Internal Server Error');
      } else {
          res.render('productslist', { products: rows });
      }
  });
});

function isAuthenticated(req, res, next) {
  if (req.session.user) {
    return next();
  } else {
    res.redirect('/login');
  }
}

app.get('/checkout', isAuthenticated, (req, res) => {
  let cartItems = [];
  if (req.cookies.shoppingCart) {
    try {
      cartItems = JSON.parse(req.cookies.shoppingCart);
    } catch (e) {
      console.error('Error parsing JSON from cookie:', e);
    }
  }

  let totalQuantity = 0;
  let totalPrice = 0;

  cartItems.forEach(item => {
    totalQuantity += parseInt(item.quantity, 10);
    totalPrice += parseFloat(item.price.replace('$', '')) * parseInt(item.quantity, 10);
  });
  connection.query('SELECT * FROM prefecture', (err, results) => {
    if (err) {
      console.error('Error fetching prefecture data:', err);
      res.status(500).send('Internal Server Error');
      return;
    }
   // Get user information from session
   const { clientfirstname, phonenumber , FullAddress } = req.session.user || {};
   console.log('adress',FullAddress);
   res.render('checkout', {
     user: req.session.user,
     cartItems,
     totalQuantity,
     totalPrice,
     userInfo: { clientfirstname, phonenumber, FullAddress } ,// Pass user information to the template
     prefectures: results
   });
});
});

// Route to handle the checkout process
app.post('/checkout', isAuthenticated, (req, res) => {
  const clientID = req.session.user.idC;  // Assuming 'idC' is the column name in the session
  const { name, city, shippingPriceValue, items } = req.body;
    console.log('Name:', name);
    console.log('City:', city);
    console.log('Shipping Price:', shippingPriceValue);
    console.log('Items:', items);

  // Insert the order details into the database
  // const insertQuery = `
  //     INSERT INTO orderdetails (clientID, productID, quantity, shippingPlace, shippingPrice, totalPrice, date, shippingStatu, orderStatu) 
  //     VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
  // `;
  // const values = [clientID, productID, quantity, shippingPlace, shippingPrice, totalPrice, date, 'ongoing', 'ongoing'];

  // connection.query(insertQuery, values, (err, result) => {
  //     if (err) {
  //         console.error('Error inserting order details:', err);
  //         res.status(500).send('Internal Server Error');
  //         return;
  //     }

  //     // Clear the cart data (remove items from the cart)
  //     // You need to implement this part based on how your cart data is stored

  //     // Send a response indicating success
  //     res.status(200).send('Order placed successfully!');
  // });
});


const csv = require('csv-parser');

// Function to read CSV file and return a promise
const readCSV = (filePath) => {
  return new Promise((resolve, reject) => {
    const results = [];
    fs.createReadStream(filePath)
      .pipe(csv())
      .on('data', (data) => results.push(data))
      .on('end', () => resolve(results))
      .on('error', (error) => reject(error));
  });
};

// Function to check if products exist in the database
const checkProductsInDatabase = (productNames) => {
  return new Promise((resolve, reject) => {
    if (productNames.length === 0) {
      resolve([]);
      return;
    }
    const placeholders = productNames.map(() => '?').join(',');
    const query = `SELECT name FROM product WHERE name IN (${placeholders})`;
    connection.query(query, productNames, (error, results) => {
      if (error) {
        return reject(error);
      }
      resolve(results.map(row => row.name));
    });
  });
};
// Function to update the 'exist' attribute in the database for existing products
const updateExistAttribute = (productNames) => {
  return new Promise((resolve, reject) => {
    if (productNames.length === 0) {
      resolve();
      return;
    }
    const query = `UPDATE product SET exist = 'TRUE' WHERE name IN (?)`;
    connection.query(query, [productNames], (error) => {
      if (error) {
        return reject(error);
      }
      resolve();
    });
  });
};

// Main function to find the required products
const findProductsInSameCluster = async (authorId, reviewFilePath, productFilePath) => {
  try {
    // Read the reviews and products_with_clusters data
    const reviews = await readCSV(reviewFilePath);
    const productsWithClusters = await readCSV(productFilePath);

    // Find a product with rating 5 for the specified author_id in the reviews file
    const chosenReview = reviews.find(
      (review) => review.author_id === authorId && review.rating === '5'
    );

    if (!chosenReview) {
      console.log('No product found with rating 5 for the specified author.');
      return;
    }

    const chosenProductId = chosenReview.product_id;

    // Find the cluster of the chosen product in the products_with_clusters file
    const chosenProduct = productsWithClusters.find(
      (product) => product.product_id === chosenProductId
    );

    if (!chosenProduct) {
      console.log('Chosen product not found in products_with_clusters.');
      return;
    }

    const chosenProductCluster = chosenProduct.cluster;

    // Filter products by cluster, brand, and rating
    const targetBrands = ['belif', 'LANEIGE', 'glow recipe'];
    const productsInSameCluster = productsWithClusters.filter(
      (product) =>
        product.cluster === chosenProductCluster &&
        targetBrands.includes(product.brand_name) &&
        product.rating >= '4'
    );

    const productNames = productsInSameCluster.map(product => product.product_name);

    // Check if the products exist in the database
const existingProducts = await checkProductsInDatabase(productNames);

// Update 'exist' attribute in the database for existing products
await updateExistAttribute(existingProducts);


    console.log('Products in the same cluster from specified brands with rating >= 4 that exist in the database:', existingProducts);
  } catch (error) {
    console.error('Error:', error);
  }
};

// Specify the file paths
const reviewFilePath = 'reviews_1250-end.csv';
const productFilePath = 'products_with_clusters.csv';

// Specify the author id
const authorId = '32069143616';

// Call the main function
findProductsInSameCluster(authorId, reviewFilePath, productFilePath);

// Keep the connection open indefinitely
connection.on('error', (err) => {
  console.error('Database connection error:', err);
  // Attempt to reconnect
  if (err.code === 'PROTOCOL_CONNECTION_LOST') {
    console.log('Attempting to reconnect to the database...');
    connection.connect();
  } else {
     throw err;
  }
});