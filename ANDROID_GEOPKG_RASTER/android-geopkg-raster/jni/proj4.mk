include $(CLEAR_VARS)
LOCAL_MODULE := proj
LOCAL_SRC := $(LOCAL_PATH)/proj-4.8.0/src
LOCAL_C_INCLUDES += $(LOCAL_SRC)
LOCAL_SRC_FILES := $(LOCAL_SRC)/PJ_aeqd.c $(LOCAL_SRC)/PJ_gnom.c $(LOCAL_SRC)/PJ_laea.c $(LOCAL_SRC)/PJ_mod_ster.c \
                   	$(LOCAL_SRC)/PJ_nsper.c $(LOCAL_SRC)/PJ_nzmg.c $(LOCAL_SRC)/PJ_ortho.c $(LOCAL_SRC)/PJ_stere.c $(LOCAL_SRC)/PJ_sterea.c \
                   	$(LOCAL_SRC)/proj_rouss.c \
                   	$(LOCAL_SRC)/PJ_aea.c $(LOCAL_SRC)/PJ_bipc.c $(LOCAL_SRC)/PJ_bonne.c $(LOCAL_SRC)/PJ_eqdc.c \
                    	$(LOCAL_SRC)/PJ_imw_p.c $(LOCAL_SRC)/PJ_lcc.c $(LOCAL_SRC)/PJ_poly.c \
                    	$(LOCAL_SRC)/PJ_rpoly.c $(LOCAL_SRC)/PJ_sconics.c $(LOCAL_SRC)/PJ_lcca.c \
                    		$(LOCAL_SRC)/PJ_cass.c $(LOCAL_SRC)/PJ_cc.c $(LOCAL_SRC)/PJ_cea.c $(LOCAL_SRC)/PJ_eqc.c \
                        	$(LOCAL_SRC)/PJ_gall.c $(LOCAL_SRC)/PJ_labrd.c $(LOCAL_SRC)/PJ_lsat.c $(LOCAL_SRC)/PJ_merc.c \
                        	$(LOCAL_SRC)/PJ_mill.c $(LOCAL_SRC)/PJ_ocea.c $(LOCAL_SRC)/PJ_omerc.c $(LOCAL_SRC)/PJ_somerc.c \
                        	$(LOCAL_SRC)/PJ_tcc.c $(LOCAL_SRC)/PJ_tcea.c $(LOCAL_SRC)/PJ_tmerc.c $(LOCAL_SRC)/PJ_geos.c \
                        	$(LOCAL_SRC)/PJ_gstmerc.c $(LOCAL_SRC)/proj_etmerc.c \
                        	$(LOCAL_SRC)/PJ_airy.c $(LOCAL_SRC)/PJ_aitoff.c $(LOCAL_SRC)/PJ_august.c $(LOCAL_SRC)/PJ_bacon.c \
                            	$(LOCAL_SRC)/PJ_chamb.c $(LOCAL_SRC)/PJ_hammer.c $(LOCAL_SRC)/PJ_lagrng.c $(LOCAL_SRC)/PJ_larr.c \
                            	$(LOCAL_SRC)/PJ_lask.c $(LOCAL_SRC)/PJ_nocol.c $(LOCAL_SRC)/PJ_ob_tran.c $(LOCAL_SRC)/PJ_oea.c \
                            	$(LOCAL_SRC)/PJ_tpeqd.c $(LOCAL_SRC)/PJ_vandg.c $(LOCAL_SRC)/PJ_vandg2.c $(LOCAL_SRC)/PJ_vandg4.c \
                            	$(LOCAL_SRC)/PJ_wag7.c $(LOCAL_SRC)/pj_latlong.c $(LOCAL_SRC)/PJ_krovak.c $(LOCAL_SRC)/pj_geocent.c \
                            	$(LOCAL_SRC)/PJ_healpix.c $(LOCAL_SRC)/PJ_natearth.c \
                            		$(LOCAL_SRC)/PJ_boggs.c $(LOCAL_SRC)/PJ_collg.c $(LOCAL_SRC)/PJ_crast.c $(LOCAL_SRC)/PJ_denoy.c \
                                	$(LOCAL_SRC)/PJ_eck1.c $(LOCAL_SRC)/PJ_eck2.c $(LOCAL_SRC)/PJ_eck3.c $(LOCAL_SRC)/PJ_eck4.c \
                                	$(LOCAL_SRC)/PJ_eck5.c $(LOCAL_SRC)/PJ_fahey.c $(LOCAL_SRC)/PJ_fouc_s.c $(LOCAL_SRC)/PJ_gins8.c \
                                	$(LOCAL_SRC)/PJ_gn_sinu.c $(LOCAL_SRC)/PJ_goode.c $(LOCAL_SRC)/PJ_igh.c $(LOCAL_SRC)/PJ_hatano.c $(LOCAL_SRC)/PJ_loxim.c \
                                	$(LOCAL_SRC)/PJ_mbt_fps.c $(LOCAL_SRC)/PJ_mbtfpp.c $(LOCAL_SRC)/PJ_mbtfpq.c $(LOCAL_SRC)/PJ_moll.c \
                                	$(LOCAL_SRC)/PJ_nell.c $(LOCAL_SRC)/PJ_nell_h.c $(LOCAL_SRC)/PJ_putp2.c $(LOCAL_SRC)/PJ_putp3.c \
                                	$(LOCAL_SRC)/PJ_putp4p.c $(LOCAL_SRC)/PJ_putp5.c $(LOCAL_SRC)/PJ_putp6.c $(LOCAL_SRC)/PJ_robin.c \
                                	$(LOCAL_SRC)/PJ_sts.c $(LOCAL_SRC)/PJ_urm5.c $(LOCAL_SRC)/PJ_urmfps.c $(LOCAL_SRC)/PJ_wag2.c \
                                	$(LOCAL_SRC)/PJ_wag3.c $(LOCAL_SRC)/PJ_wink1.c $(LOCAL_SRC)/PJ_wink2.c $(LOCAL_SRC)/PJ_isea.c \
                                	$(LOCAL_SRC)/aasincos.c $(LOCAL_SRC)/adjlon.c $(LOCAL_SRC)/bch2bps.c $(LOCAL_SRC)/bchgen.c $(LOCAL_SRC)/pj_gauss.c \
                                    	$(LOCAL_SRC)/biveval.c $(LOCAL_SRC)/dmstor.c $(LOCAL_SRC)/mk_cheby.c $(LOCAL_SRC)/pj_auth.c \
                                    	$(LOCAL_SRC)/pj_deriv.c $(LOCAL_SRC)/pj_ell_set.c $(LOCAL_SRC)/pj_ellps.c $(LOCAL_SRC)/pj_errno.c \
                                    	$(LOCAL_SRC)/pj_factors.c $(LOCAL_SRC)/pj_fwd.c $(LOCAL_SRC)/pj_init.c $(LOCAL_SRC)/pj_inv.c \
                                    	$(LOCAL_SRC)/pj_list.c $(LOCAL_SRC)/pj_malloc.c $(LOCAL_SRC)/pj_mlfn.c $(LOCAL_SRC)/pj_msfn.c \
                                    	$(LOCAL_SRC)/pj_open_lib.c $(LOCAL_SRC)/pj_param.c $(LOCAL_SRC)/pj_phi2.c $(LOCAL_SRC)/pj_pr_list.c \
                                    	$(LOCAL_SRC)/pj_qsfn.c $(LOCAL_SRC)/pj_strerrno.c $(LOCAL_SRC)/pj_tsfn.c $(LOCAL_SRC)/pj_units.c \
                                    	$(LOCAL_SRC)/pj_zpoly1.c $(LOCAL_SRC)/rtodms.c $(LOCAL_SRC)/vector1.c $(LOCAL_SRC)/pj_release.c \
                                    	$(LOCAL_SRC)/geocent.c $(LOCAL_SRC)/pj_transform.c $(LOCAL_SRC)/pj_datum_set.c $(LOCAL_SRC)/pj_datums.c \
                                    	$(LOCAL_SRC)/pj_apply_gridshift.c $(LOCAL_SRC)/nad_cvt.c $(LOCAL_SRC)/nad_init.c \
                                    	$(LOCAL_SRC)/nad_intr.c $(LOCAL_SRC)/pj_utils.c $(LOCAL_SRC)/pj_gridlist.c $(LOCAL_SRC)/pj_gridinfo.c \
                                    	$(LOCAL_SRC)/proj_mdist.c $(LOCAL_SRC)/pj_mutex.c $(LOCAL_SRC)/pj_initcache.c \
                                    	$(LOCAL_SRC)/pj_ctx.c $(LOCAL_SRC)/pj_log.c $(LOCAL_SRC)/pj_apply_vgridshift.c

include $(BUILD_STATIC_LIBRARY)
