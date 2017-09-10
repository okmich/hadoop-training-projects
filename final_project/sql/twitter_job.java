// ORM class for table 'twitter_job'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Sun Sep 10 09:06:13 PDT 2017
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

public class twitter_job extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  public static interface FieldSetterCommand {    void setField(Object value);  }  protected ResultSet __cur_result_set;
  private Map<String, FieldSetterCommand> setters = new HashMap<String, FieldSetterCommand>();
  private void init0() {
    setters.put("id", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        id = (Long)value;
      }
    });
    setters.put("ts", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        ts = (Long)value;
      }
    });
    setters.put("twtlang", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        twtlang = (String)value;
      }
    });
    setters.put("created_at", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        created_at = (String)value;
      }
    });
    setters.put("tweet_text", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        tweet_text = (String)value;
      }
    });
    setters.put("url", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        url = (String)value;
      }
    });
    setters.put("source", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        source = (String)value;
      }
    });
    setters.put("hashtags", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        hashtags = (String)value;
      }
    });
    setters.put("agent_location", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        agent_location = (String)value;
      }
    });
    setters.put("agent_desc", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        agent_desc = (String)value;
      }
    });
    setters.put("agent_name", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        agent_name = (String)value;
      }
    });
    setters.put("agent_image_url", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        agent_image_url = (String)value;
      }
    });
    setters.put("screen_name", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        screen_name = (String)value;
      }
    });
    setters.put("follower_count", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        follower_count = (Integer)value;
      }
    });
    setters.put("year", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        year = (String)value;
      }
    });
    setters.put("month", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        month = (String)value;
      }
    });
    setters.put("day", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        day = (String)value;
      }
    });
    setters.put("hour", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        hour = (String)value;
      }
    });
  }
  public twitter_job() {
    init0();
  }
  private Long id;
  public Long get_id() {
    return id;
  }
  public void set_id(Long id) {
    this.id = id;
  }
  public twitter_job with_id(Long id) {
    this.id = id;
    return this;
  }
  private Long ts;
  public Long get_ts() {
    return ts;
  }
  public void set_ts(Long ts) {
    this.ts = ts;
  }
  public twitter_job with_ts(Long ts) {
    this.ts = ts;
    return this;
  }
  private String twtlang;
  public String get_twtlang() {
    return twtlang;
  }
  public void set_twtlang(String twtlang) {
    this.twtlang = twtlang;
  }
  public twitter_job with_twtlang(String twtlang) {
    this.twtlang = twtlang;
    return this;
  }
  private String created_at;
  public String get_created_at() {
    return created_at;
  }
  public void set_created_at(String created_at) {
    this.created_at = created_at;
  }
  public twitter_job with_created_at(String created_at) {
    this.created_at = created_at;
    return this;
  }
  private String tweet_text;
  public String get_tweet_text() {
    return tweet_text;
  }
  public void set_tweet_text(String tweet_text) {
    this.tweet_text = tweet_text;
  }
  public twitter_job with_tweet_text(String tweet_text) {
    this.tweet_text = tweet_text;
    return this;
  }
  private String url;
  public String get_url() {
    return url;
  }
  public void set_url(String url) {
    this.url = url;
  }
  public twitter_job with_url(String url) {
    this.url = url;
    return this;
  }
  private String source;
  public String get_source() {
    return source;
  }
  public void set_source(String source) {
    this.source = source;
  }
  public twitter_job with_source(String source) {
    this.source = source;
    return this;
  }
  private String hashtags;
  public String get_hashtags() {
    return hashtags;
  }
  public void set_hashtags(String hashtags) {
    this.hashtags = hashtags;
  }
  public twitter_job with_hashtags(String hashtags) {
    this.hashtags = hashtags;
    return this;
  }
  private String agent_location;
  public String get_agent_location() {
    return agent_location;
  }
  public void set_agent_location(String agent_location) {
    this.agent_location = agent_location;
  }
  public twitter_job with_agent_location(String agent_location) {
    this.agent_location = agent_location;
    return this;
  }
  private String agent_desc;
  public String get_agent_desc() {
    return agent_desc;
  }
  public void set_agent_desc(String agent_desc) {
    this.agent_desc = agent_desc;
  }
  public twitter_job with_agent_desc(String agent_desc) {
    this.agent_desc = agent_desc;
    return this;
  }
  private String agent_name;
  public String get_agent_name() {
    return agent_name;
  }
  public void set_agent_name(String agent_name) {
    this.agent_name = agent_name;
  }
  public twitter_job with_agent_name(String agent_name) {
    this.agent_name = agent_name;
    return this;
  }
  private String agent_image_url;
  public String get_agent_image_url() {
    return agent_image_url;
  }
  public void set_agent_image_url(String agent_image_url) {
    this.agent_image_url = agent_image_url;
  }
  public twitter_job with_agent_image_url(String agent_image_url) {
    this.agent_image_url = agent_image_url;
    return this;
  }
  private String screen_name;
  public String get_screen_name() {
    return screen_name;
  }
  public void set_screen_name(String screen_name) {
    this.screen_name = screen_name;
  }
  public twitter_job with_screen_name(String screen_name) {
    this.screen_name = screen_name;
    return this;
  }
  private Integer follower_count;
  public Integer get_follower_count() {
    return follower_count;
  }
  public void set_follower_count(Integer follower_count) {
    this.follower_count = follower_count;
  }
  public twitter_job with_follower_count(Integer follower_count) {
    this.follower_count = follower_count;
    return this;
  }
  private String year;
  public String get_year() {
    return year;
  }
  public void set_year(String year) {
    this.year = year;
  }
  public twitter_job with_year(String year) {
    this.year = year;
    return this;
  }
  private String month;
  public String get_month() {
    return month;
  }
  public void set_month(String month) {
    this.month = month;
  }
  public twitter_job with_month(String month) {
    this.month = month;
    return this;
  }
  private String day;
  public String get_day() {
    return day;
  }
  public void set_day(String day) {
    this.day = day;
  }
  public twitter_job with_day(String day) {
    this.day = day;
    return this;
  }
  private String hour;
  public String get_hour() {
    return hour;
  }
  public void set_hour(String hour) {
    this.hour = hour;
  }
  public twitter_job with_hour(String hour) {
    this.hour = hour;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof twitter_job)) {
      return false;
    }
    twitter_job that = (twitter_job) o;
    boolean equal = true;
    equal = equal && (this.id == null ? that.id == null : this.id.equals(that.id));
    equal = equal && (this.ts == null ? that.ts == null : this.ts.equals(that.ts));
    equal = equal && (this.twtlang == null ? that.twtlang == null : this.twtlang.equals(that.twtlang));
    equal = equal && (this.created_at == null ? that.created_at == null : this.created_at.equals(that.created_at));
    equal = equal && (this.tweet_text == null ? that.tweet_text == null : this.tweet_text.equals(that.tweet_text));
    equal = equal && (this.url == null ? that.url == null : this.url.equals(that.url));
    equal = equal && (this.source == null ? that.source == null : this.source.equals(that.source));
    equal = equal && (this.hashtags == null ? that.hashtags == null : this.hashtags.equals(that.hashtags));
    equal = equal && (this.agent_location == null ? that.agent_location == null : this.agent_location.equals(that.agent_location));
    equal = equal && (this.agent_desc == null ? that.agent_desc == null : this.agent_desc.equals(that.agent_desc));
    equal = equal && (this.agent_name == null ? that.agent_name == null : this.agent_name.equals(that.agent_name));
    equal = equal && (this.agent_image_url == null ? that.agent_image_url == null : this.agent_image_url.equals(that.agent_image_url));
    equal = equal && (this.screen_name == null ? that.screen_name == null : this.screen_name.equals(that.screen_name));
    equal = equal && (this.follower_count == null ? that.follower_count == null : this.follower_count.equals(that.follower_count));
    equal = equal && (this.year == null ? that.year == null : this.year.equals(that.year));
    equal = equal && (this.month == null ? that.month == null : this.month.equals(that.month));
    equal = equal && (this.day == null ? that.day == null : this.day.equals(that.day));
    equal = equal && (this.hour == null ? that.hour == null : this.hour.equals(that.hour));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof twitter_job)) {
      return false;
    }
    twitter_job that = (twitter_job) o;
    boolean equal = true;
    equal = equal && (this.id == null ? that.id == null : this.id.equals(that.id));
    equal = equal && (this.ts == null ? that.ts == null : this.ts.equals(that.ts));
    equal = equal && (this.twtlang == null ? that.twtlang == null : this.twtlang.equals(that.twtlang));
    equal = equal && (this.created_at == null ? that.created_at == null : this.created_at.equals(that.created_at));
    equal = equal && (this.tweet_text == null ? that.tweet_text == null : this.tweet_text.equals(that.tweet_text));
    equal = equal && (this.url == null ? that.url == null : this.url.equals(that.url));
    equal = equal && (this.source == null ? that.source == null : this.source.equals(that.source));
    equal = equal && (this.hashtags == null ? that.hashtags == null : this.hashtags.equals(that.hashtags));
    equal = equal && (this.agent_location == null ? that.agent_location == null : this.agent_location.equals(that.agent_location));
    equal = equal && (this.agent_desc == null ? that.agent_desc == null : this.agent_desc.equals(that.agent_desc));
    equal = equal && (this.agent_name == null ? that.agent_name == null : this.agent_name.equals(that.agent_name));
    equal = equal && (this.agent_image_url == null ? that.agent_image_url == null : this.agent_image_url.equals(that.agent_image_url));
    equal = equal && (this.screen_name == null ? that.screen_name == null : this.screen_name.equals(that.screen_name));
    equal = equal && (this.follower_count == null ? that.follower_count == null : this.follower_count.equals(that.follower_count));
    equal = equal && (this.year == null ? that.year == null : this.year.equals(that.year));
    equal = equal && (this.month == null ? that.month == null : this.month.equals(that.month));
    equal = equal && (this.day == null ? that.day == null : this.day.equals(that.day));
    equal = equal && (this.hour == null ? that.hour == null : this.hour.equals(that.hour));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.id = JdbcWritableBridge.readLong(1, __dbResults);
    this.ts = JdbcWritableBridge.readLong(2, __dbResults);
    this.twtlang = JdbcWritableBridge.readString(3, __dbResults);
    this.created_at = JdbcWritableBridge.readString(4, __dbResults);
    this.tweet_text = JdbcWritableBridge.readString(5, __dbResults);
    this.url = JdbcWritableBridge.readString(6, __dbResults);
    this.source = JdbcWritableBridge.readString(7, __dbResults);
    this.hashtags = JdbcWritableBridge.readString(8, __dbResults);
    this.agent_location = JdbcWritableBridge.readString(9, __dbResults);
    this.agent_desc = JdbcWritableBridge.readString(10, __dbResults);
    this.agent_name = JdbcWritableBridge.readString(11, __dbResults);
    this.agent_image_url = JdbcWritableBridge.readString(12, __dbResults);
    this.screen_name = JdbcWritableBridge.readString(13, __dbResults);
    this.follower_count = JdbcWritableBridge.readInteger(14, __dbResults);
    this.year = JdbcWritableBridge.readString(15, __dbResults);
    this.month = JdbcWritableBridge.readString(16, __dbResults);
    this.day = JdbcWritableBridge.readString(17, __dbResults);
    this.hour = JdbcWritableBridge.readString(18, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.id = JdbcWritableBridge.readLong(1, __dbResults);
    this.ts = JdbcWritableBridge.readLong(2, __dbResults);
    this.twtlang = JdbcWritableBridge.readString(3, __dbResults);
    this.created_at = JdbcWritableBridge.readString(4, __dbResults);
    this.tweet_text = JdbcWritableBridge.readString(5, __dbResults);
    this.url = JdbcWritableBridge.readString(6, __dbResults);
    this.source = JdbcWritableBridge.readString(7, __dbResults);
    this.hashtags = JdbcWritableBridge.readString(8, __dbResults);
    this.agent_location = JdbcWritableBridge.readString(9, __dbResults);
    this.agent_desc = JdbcWritableBridge.readString(10, __dbResults);
    this.agent_name = JdbcWritableBridge.readString(11, __dbResults);
    this.agent_image_url = JdbcWritableBridge.readString(12, __dbResults);
    this.screen_name = JdbcWritableBridge.readString(13, __dbResults);
    this.follower_count = JdbcWritableBridge.readInteger(14, __dbResults);
    this.year = JdbcWritableBridge.readString(15, __dbResults);
    this.month = JdbcWritableBridge.readString(16, __dbResults);
    this.day = JdbcWritableBridge.readString(17, __dbResults);
    this.hour = JdbcWritableBridge.readString(18, __dbResults);
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
    JdbcWritableBridge.writeLong(id, 1 + __off, -5, __dbStmt);
    JdbcWritableBridge.writeLong(ts, 2 + __off, -5, __dbStmt);
    JdbcWritableBridge.writeString(twtlang, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(created_at, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(tweet_text, 5 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(url, 6 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(source, 7 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(hashtags, 8 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(agent_location, 9 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(agent_desc, 10 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(agent_name, 11 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(agent_image_url, 12 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(screen_name, 13 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(follower_count, 14 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeString(year, 15 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(month, 16 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(day, 17 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(hour, 18 + __off, 12, __dbStmt);
    return 18;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeLong(id, 1 + __off, -5, __dbStmt);
    JdbcWritableBridge.writeLong(ts, 2 + __off, -5, __dbStmt);
    JdbcWritableBridge.writeString(twtlang, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(created_at, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(tweet_text, 5 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(url, 6 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(source, 7 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(hashtags, 8 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(agent_location, 9 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(agent_desc, 10 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(agent_name, 11 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(agent_image_url, 12 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(screen_name, 13 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(follower_count, 14 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeString(year, 15 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(month, 16 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(day, 17 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(hour, 18 + __off, 12, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.id = null;
    } else {
    this.id = Long.valueOf(__dataIn.readLong());
    }
    if (__dataIn.readBoolean()) { 
        this.ts = null;
    } else {
    this.ts = Long.valueOf(__dataIn.readLong());
    }
    if (__dataIn.readBoolean()) { 
        this.twtlang = null;
    } else {
    this.twtlang = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.created_at = null;
    } else {
    this.created_at = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.tweet_text = null;
    } else {
    this.tweet_text = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.url = null;
    } else {
    this.url = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.source = null;
    } else {
    this.source = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.hashtags = null;
    } else {
    this.hashtags = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.agent_location = null;
    } else {
    this.agent_location = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.agent_desc = null;
    } else {
    this.agent_desc = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.agent_name = null;
    } else {
    this.agent_name = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.agent_image_url = null;
    } else {
    this.agent_image_url = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.screen_name = null;
    } else {
    this.screen_name = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.follower_count = null;
    } else {
    this.follower_count = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.year = null;
    } else {
    this.year = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.month = null;
    } else {
    this.month = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.day = null;
    } else {
    this.day = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.hour = null;
    } else {
    this.hour = Text.readString(__dataIn);
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.id) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.id);
    }
    if (null == this.ts) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.ts);
    }
    if (null == this.twtlang) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, twtlang);
    }
    if (null == this.created_at) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, created_at);
    }
    if (null == this.tweet_text) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, tweet_text);
    }
    if (null == this.url) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, url);
    }
    if (null == this.source) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, source);
    }
    if (null == this.hashtags) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, hashtags);
    }
    if (null == this.agent_location) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, agent_location);
    }
    if (null == this.agent_desc) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, agent_desc);
    }
    if (null == this.agent_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, agent_name);
    }
    if (null == this.agent_image_url) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, agent_image_url);
    }
    if (null == this.screen_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, screen_name);
    }
    if (null == this.follower_count) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.follower_count);
    }
    if (null == this.year) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, year);
    }
    if (null == this.month) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, month);
    }
    if (null == this.day) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, day);
    }
    if (null == this.hour) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, hour);
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.id) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.id);
    }
    if (null == this.ts) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.ts);
    }
    if (null == this.twtlang) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, twtlang);
    }
    if (null == this.created_at) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, created_at);
    }
    if (null == this.tweet_text) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, tweet_text);
    }
    if (null == this.url) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, url);
    }
    if (null == this.source) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, source);
    }
    if (null == this.hashtags) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, hashtags);
    }
    if (null == this.agent_location) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, agent_location);
    }
    if (null == this.agent_desc) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, agent_desc);
    }
    if (null == this.agent_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, agent_name);
    }
    if (null == this.agent_image_url) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, agent_image_url);
    }
    if (null == this.screen_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, screen_name);
    }
    if (null == this.follower_count) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.follower_count);
    }
    if (null == this.year) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, year);
    }
    if (null == this.month) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, month);
    }
    if (null == this.day) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, day);
    }
    if (null == this.hour) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, hour);
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
    __sb.append(FieldFormatter.escapeAndEnclose(id==null?"null":"" + id, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ts==null?"null":"" + ts, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(twtlang==null?"null":twtlang, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(created_at==null?"null":created_at, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(tweet_text==null?"null":tweet_text, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(url==null?"null":url, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(source==null?"null":source, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(hashtags==null?"null":hashtags, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(agent_location==null?"null":agent_location, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(agent_desc==null?"null":agent_desc, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(agent_name==null?"null":agent_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(agent_image_url==null?"null":agent_image_url, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(screen_name==null?"null":screen_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(follower_count==null?"null":"" + follower_count, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(year==null?"null":year, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(month==null?"null":month, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(day==null?"null":day, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(hour==null?"null":hour, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(id==null?"null":"" + id, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ts==null?"null":"" + ts, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(twtlang==null?"null":twtlang, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(created_at==null?"null":created_at, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(tweet_text==null?"null":tweet_text, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(url==null?"null":url, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(source==null?"null":source, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(hashtags==null?"null":hashtags, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(agent_location==null?"null":agent_location, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(agent_desc==null?"null":agent_desc, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(agent_name==null?"null":agent_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(agent_image_url==null?"null":agent_image_url, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(screen_name==null?"null":screen_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(follower_count==null?"null":"" + follower_count, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(year==null?"null":year, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(month==null?"null":month, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(day==null?"null":day, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(hour==null?"null":hour, delimiters));
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
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.id = null; } else {
      this.id = Long.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.ts = null; } else {
      this.ts = Long.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.twtlang = null; } else {
      this.twtlang = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.created_at = null; } else {
      this.created_at = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.tweet_text = null; } else {
      this.tweet_text = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.url = null; } else {
      this.url = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.source = null; } else {
      this.source = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.hashtags = null; } else {
      this.hashtags = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.agent_location = null; } else {
      this.agent_location = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.agent_desc = null; } else {
      this.agent_desc = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.agent_name = null; } else {
      this.agent_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.agent_image_url = null; } else {
      this.agent_image_url = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.screen_name = null; } else {
      this.screen_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.follower_count = null; } else {
      this.follower_count = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.year = null; } else {
      this.year = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.month = null; } else {
      this.month = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.day = null; } else {
      this.day = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.hour = null; } else {
      this.hour = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.id = null; } else {
      this.id = Long.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.ts = null; } else {
      this.ts = Long.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.twtlang = null; } else {
      this.twtlang = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.created_at = null; } else {
      this.created_at = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.tweet_text = null; } else {
      this.tweet_text = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.url = null; } else {
      this.url = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.source = null; } else {
      this.source = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.hashtags = null; } else {
      this.hashtags = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.agent_location = null; } else {
      this.agent_location = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.agent_desc = null; } else {
      this.agent_desc = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.agent_name = null; } else {
      this.agent_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.agent_image_url = null; } else {
      this.agent_image_url = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.screen_name = null; } else {
      this.screen_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.follower_count = null; } else {
      this.follower_count = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.year = null; } else {
      this.year = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.month = null; } else {
      this.month = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.day = null; } else {
      this.day = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.hour = null; } else {
      this.hour = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    twitter_job o = (twitter_job) super.clone();
    return o;
  }

  public void clone0(twitter_job o) throws CloneNotSupportedException {
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new HashMap<String, Object>();
    __sqoop$field_map.put("id", this.id);
    __sqoop$field_map.put("ts", this.ts);
    __sqoop$field_map.put("twtlang", this.twtlang);
    __sqoop$field_map.put("created_at", this.created_at);
    __sqoop$field_map.put("tweet_text", this.tweet_text);
    __sqoop$field_map.put("url", this.url);
    __sqoop$field_map.put("source", this.source);
    __sqoop$field_map.put("hashtags", this.hashtags);
    __sqoop$field_map.put("agent_location", this.agent_location);
    __sqoop$field_map.put("agent_desc", this.agent_desc);
    __sqoop$field_map.put("agent_name", this.agent_name);
    __sqoop$field_map.put("agent_image_url", this.agent_image_url);
    __sqoop$field_map.put("screen_name", this.screen_name);
    __sqoop$field_map.put("follower_count", this.follower_count);
    __sqoop$field_map.put("year", this.year);
    __sqoop$field_map.put("month", this.month);
    __sqoop$field_map.put("day", this.day);
    __sqoop$field_map.put("hour", this.hour);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("id", this.id);
    __sqoop$field_map.put("ts", this.ts);
    __sqoop$field_map.put("twtlang", this.twtlang);
    __sqoop$field_map.put("created_at", this.created_at);
    __sqoop$field_map.put("tweet_text", this.tweet_text);
    __sqoop$field_map.put("url", this.url);
    __sqoop$field_map.put("source", this.source);
    __sqoop$field_map.put("hashtags", this.hashtags);
    __sqoop$field_map.put("agent_location", this.agent_location);
    __sqoop$field_map.put("agent_desc", this.agent_desc);
    __sqoop$field_map.put("agent_name", this.agent_name);
    __sqoop$field_map.put("agent_image_url", this.agent_image_url);
    __sqoop$field_map.put("screen_name", this.screen_name);
    __sqoop$field_map.put("follower_count", this.follower_count);
    __sqoop$field_map.put("year", this.year);
    __sqoop$field_map.put("month", this.month);
    __sqoop$field_map.put("day", this.day);
    __sqoop$field_map.put("hour", this.hour);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if (!setters.containsKey(__fieldName)) {
      throw new RuntimeException("No such field:"+__fieldName);
    }
    setters.get(__fieldName).setField(__fieldVal);
  }

}
