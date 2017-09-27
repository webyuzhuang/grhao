package com.fz.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "wg_user")
public class UserDo {
    /**
     * 用户注册id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * 用户名
     */
    private String name;

    /**
     * 登录密码
     */
    private String pass;

    /**
     * 手机号码
     */
    private String tel;

    /**
     * 状态 1:可用状态  0:删除状态  2:锁定状态
     */
    @Column(name = "STATE")
    private Byte state;

    /**
     * 创建人ID
     */
    @Column(name = "CREATE_BY")
    private Long createBy;

    /**
     * 创建时间
     */
    @Column(name = "CREATE_DATE")
    private Date createDate;

    /**
     * 修改人ID
     */
    @Column(name = "UPDATE_BY")
    private Long updateBy;

    /**
     * 修改时间
     */
    @Column(name = "UPDATE_DATE")
    private Date updateDate;

    /**
     * 获取用户注册id
     *
     * @return id - 用户注册id
     */
    public Long getId() {
        return id;
    }

    /**
     * 设置用户注册id
     *
     * @param id 用户注册id
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 获取用户名
     *
     * @return name - 用户名
     */
    public String getName() {
        return name;
    }

    /**
     * 设置用户名
     *
     * @param name 用户名
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取登录密码
     *
     * @return pass - 登录密码
     */
    public String getPass() {
        return pass;
    }

    /**
     * 设置登录密码
     *
     * @param pass 登录密码
     */
    public void setPass(String pass) {
        this.pass = pass;
    }

    /**
     * 获取手机号码
     *
     * @return tel - 手机号码
     */
    public String getTel() {
        return tel;
    }

    /**
     * 设置手机号码
     *
     * @param tel 手机号码
     */
    public void setTel(String tel) {
        this.tel = tel;
    }

    /**
     * 获取状态 1:可用状态  0:删除状态  2:锁定状态
     *
     * @return STATE - 状态 1:可用状态  0:删除状态  2:锁定状态
     */
    public Byte getState() {
        return state;
    }

    /**
     * 设置状态 1:可用状态  0:删除状态  2:锁定状态
     *
     * @param state 状态 1:可用状态  0:删除状态  2:锁定状态
     */
    public void setState(Byte state) {
        this.state = state;
    }

    /**
     * 获取创建人ID
     *
     * @return CREATE_BY - 创建人ID
     */
    public Long getCreateBy() {
        return createBy;
    }

    /**
     * 设置创建人ID
     *
     * @param createBy 创建人ID
     */
    public void setCreateBy(Long createBy) {
        this.createBy = createBy;
    }

    /**
     * 获取创建时间
     *
     * @return CREATE_DATE - 创建时间
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * 设置创建时间
     *
     * @param createDate 创建时间
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * 获取修改人ID
     *
     * @return UPDATE_BY - 修改人ID
     */
    public Long getUpdateBy() {
        return updateBy;
    }

    /**
     * 设置修改人ID
     *
     * @param updateBy 修改人ID
     */
    public void setUpdateBy(Long updateBy) {
        this.updateBy = updateBy;
    }

    /**
     * 获取修改时间
     *
     * @return UPDATE_DATE - 修改时间
     */
    public Date getUpdateDate() {
        return updateDate;
    }

    /**
     * 设置修改时间
     *
     * @param updateDate 修改时间
     */
    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
}