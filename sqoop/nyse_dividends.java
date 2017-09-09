// ORM class for table 'nyse_dividends'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Sat Sep 09 09:51:04 PDT 2017
// For connector: org.apache.sqoop.manager.MySQLManager
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.mapred.lib.db.DBWritable;
import com.cloudera.sqoop.lib.JdbcWritableBridge;
import com.cloudera.sqoop.lib.DelimiterSet;
import com.cloudera.sqoop.lib.FieldFormatter;
import com.cloudera.sqoop.lib.RecordParser;
import com.cloudera.sqoop.lib.BooleanParser;
import com.cloudera.sqoop.lib.BlobRef;
import com.cloudera.sqoop.lib.ClobRef;
import com.cloudera.sqoop.lib.LargeObjectLoader;
import com.cloudera.sqoop.lib.SqoopRecord;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

public class nyse_dividends extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  public static interface FieldSetterCommand {    void setField(Object value);  }  protected ResultSet __cur_result_set;
  private Map<String, FieldSetterCommand> setters = new HashMap<String, FieldSetterCommand>();
  private void init0() {
    setters.put("exchange", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        exchange = (String)value;
      }
    });
    setters.put("stock_symbol", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        stock_symbol = (String)value;
      }
    });
    setters.put("datestring", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        datestring = (String)value;
      }
    });
    setters.put("value", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        value = (Float)value;
      }
    });
  }
  public nyse_dividends() {
    init0();
  }
  private String exchange;
  public String get_exchange() {
    return exchange;
  }
  public void set_exchange(String exchange) {
    this.exchange = exchange;
  }
  public nyse_dividends with_exchange(String exchange) {
    this.exchange = exchange;
    return this;
  }
  private String stock_symbol;
  public String get_stock_symbol() {
    return stock_symbol;
  }
  public void set_stock_symbol(String stock_symbol) {
    this.stock_symbol = stock_symbol;
  }
  public nyse_dividends with_stock_symbol(String stock_symbol) {
    this.stock_symbol = stock_symbol;
    return this;
  }
  private String datestring;
  public String get_datestring() {
    return datestring;
  }
  public void set_datestring(String datestring) {
    this.datestring = datestring;
  }
  public nyse_dividends with_datestring(String datestring) {
    this.datestring = datestring;
    return this;
  }
  private Float value;
  public Float get_value() {
    return value;
  }
  public void set_value(Float value) {
    this.value = value;
  }
  public nyse_dividends with_value(Float value) {
    this.value = value;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof nyse_dividends)) {
      return false;
    }
    nyse_dividends that = (nyse_dividends) o;
    boolean equal = true;
    equal = equal && (this.exchange == null ? that.exchange == null : this.exchange.equals(that.exchange));
    equal = equal && (this.stock_symbol == null ? that.stock_symbol == null : this.stock_symbol.equals(that.stock_symbol));
    equal = equal && (this.datestring == null ? that.datestring == null : this.datestring.equals(that.datestring));
    equal = equal && (this.value == null ? that.value == null : this.value.equals(that.value));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof nyse_dividends)) {
      return false;
    }
    nyse_dividends that = (nyse_dividends) o;
    boolean equal = true;
    equal = equal && (this.exchange == null ? that.exchange == null : this.exchange.equals(that.exchange));
    equal = equal && (this.stock_symbol == null ? that.stock_symbol == null : this.stock_symbol.equals(that.stock_symbol));
    equal = equal && (this.datestring == null ? that.datestring == null : this.datestring.equals(that.datestring));
    equal = equal && (this.value == null ? that.value == null : this.value.equals(that.value));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.exchange = JdbcWritableBridge.readString(1, __dbResults);
    this.stock_symbol = JdbcWritableBridge.readString(2, __dbResults);
    this.datestring = JdbcWritableBridge.readString(3, __dbResults);
    this.value = JdbcWritableBridge.readFloat(4, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.exchange = JdbcWritableBridge.readString(1, __dbResults);
    this.stock_symbol = JdbcWritableBridge.readString(2, __dbResults);
    this.datestring = JdbcWritableBridge.readString(3, __dbResults);
    this.value = JdbcWritableBridge.readFloat(4, __dbResults);
  }
  public void loadLargeObjects(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void loadLargeObjects0(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void write(PreparedStatement __dbStmt) throws SQLException {
    write(__dbStmt, 0);
  }

  public int write(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(exchange, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(stock_symbol, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(datestring, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeFloat(value, 4 + __off, 7, __dbStmt);
    return 4;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(exchange, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(stock_symbol, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(datestring, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeFloat(value, 4 + __off, 7, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.exchange = null;
    } else {
    this.exchange = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.stock_symbol = null;
    } else {
    this.stock_symbol = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.datestring = null;
    } else {
    this.datestring = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.value = null;
    } else {
    this.value = Float.valueOf(__dataIn.readFloat());
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.exchange) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, exchange);
    }
    if (null == this.stock_symbol) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, stock_symbol);
    }
    if (null == this.datestring) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, datestring);
    }
    if (null == this.value) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeFloat(this.value);
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.exchange) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, exchange);
    }
    if (null == this.stock_symbol) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, stock_symbol);
    }
    if (null == this.datestring) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, datestring);
    }
    if (null == this.value) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeFloat(this.value);
    }
  }
  private static final DelimiterSet __outputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  public String toString() {
    return toString(__outputDelimiters, true);
  }
  public String toString(DelimiterSet delimiters) {
    return toString(delimiters, true);
  }
  public String toString(boolean useRecordDelim) {
    return toString(__outputDelimiters, useRecordDelim);
  }
  public String toString(DelimiterSet delimiters, boolean useRecordDelim) {
    StringBuilder __sb = new StringBuilder();
    char fieldDelim = delimiters.getFieldsTerminatedBy();
    __sb.append(FieldFormatter.escapeAndEnclose(exchange==null?"null":exchange, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(stock_symbol==null?"null":stock_symbol, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(datestring==null?"null":datestring, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(value==null?"null":"" + value, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(exchange==null?"null":exchange, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(stock_symbol==null?"null":stock_symbol, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(datestring==null?"null":datestring, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(value==null?"null":"" + value, delimiters));
  }
  private static final DelimiterSet __inputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  private RecordParser __parser;
  public void parse(Text __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharSequence __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(byte [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(char [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(ByteBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  private void __loadFromFields(List<String> fields) {
    Iterator<String> __it = fields.listIterator();
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.exchange = null; } else {
      this.exchange = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.stock_symbol = null; } else {
      this.stock_symbol = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.datestring = null; } else {
      this.datestring = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.value = null; } else {
      this.value = Float.valueOf(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.exchange = null; } else {
      this.exchange = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.stock_symbol = null; } else {
      this.stock_symbol = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.datestring = null; } else {
      this.datestring = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.value = null; } else {
      this.value = Float.valueOf(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    nyse_dividends o = (nyse_dividends) super.clone();
    return o;
  }

  public void clone0(nyse_dividends o) throws CloneNotSupportedException {
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new HashMap<String, Object>();
    __sqoop$field_map.put("exchange", this.exchange);
    __sqoop$field_map.put("stock_symbol", this.stock_symbol);
    __sqoop$field_map.put("datestring", this.datestring);
    __sqoop$field_map.put("value", this.value);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("exchange", this.exchange);
    __sqoop$field_map.put("stock_symbol", this.stock_symbol);
    __sqoop$field_map.put("datestring", this.datestring);
    __sqoop$field_map.put("value", this.value);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if (!setters.containsKey(__fieldName)) {
      throw new RuntimeException("No such field:"+__fieldName);
    }
    setters.get(__fieldName).setField(__fieldVal);
  }

}
