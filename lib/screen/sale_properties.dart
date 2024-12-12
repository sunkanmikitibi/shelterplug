import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realestateapi/controllers/rent_controllers.dart';
import 'package:realestateapi/screen/details/sales_details.dart';

class SaleProperties extends StatefulWidget {
  const SaleProperties({super.key});

  @override
  State<SaleProperties> createState() => _SalePropertiesState();
}

class _SalePropertiesState extends State<SaleProperties> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RentController>(context);
    return Scaffold(
    appBar: AppBar(
      title: const Text("All Properties"),
    ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.amber.shade800,
                    Colors.amber.shade400,
                    Colors.amber.shade100,
                  ],),
              color: Colors.amber,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50,),
                  const Text(
                    "Search For Properties",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      hintText: "e.g 2 Bed room flat ...",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      prefixIcon: const Icon(
                        Icons.search,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xff2c3e50),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.sales.length,
                    itemBuilder: (context, index) {
                      final sprop = controller.sales[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SalesDetails(
                                property: sprop,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Row(
                              children: [
                                Hero(
                                  tag: sprop.title,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: sprop.image,
                                      width: 120,
                                      placeholder: (context, url) =>
                                          const Center(
                                        child: CircularProgressIndicator(
                                          color: Color(0xff2c3e50),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                              'assets/images/sheltermockuo.png'),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 150,
                                      child: Text(
                                        sprop.title,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      sprop.propertyAddress,
                                      style: const TextStyle(fontSize: 11),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      sprop.amount,
                                      style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
